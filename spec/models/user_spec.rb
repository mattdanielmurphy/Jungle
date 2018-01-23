require 'rails_helper'

describe User, type: :model do
  describe 'Validations:' do
    before(:each) do
      @user = User.create(
        firstname: 'Famous',
        lastname: 'Mortimer',
        email: 'famous@mail.com',
        password: 'strong_password',
        password_confirmation: 'strong_password'
      )
    end

    it 'should return valid' do
      expect(@user.valid?).to eq(true)
    end

    context 'Password:' do
      it 'should return invalid if password & confirmation don\'t match' do
        @user.password              = 'xxxxxxxxxxx'
        @user.password_confirmation = 'zzzzzzzzzz'
        expect(@user.valid?).to eq(false)
      end

      it 'should return invalid if password less than 10 characters long' do
        @user.password = @user.password_confirmation = 'shortpass'
        expect(@user.valid?).to eq(false)
      end
    end

    it 'should return invalid if email not unique' do
      @user2 = @user.dup
      expect(@user2.valid?).to eq(false)
    end
  end
end
