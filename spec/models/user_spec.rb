require 'rails_helper'

describe User, type: :model do
  describe 'Validations:' do
    before(:each) do
      @user = User.create(
        firstname: 'Penn',
        lastname: 'Jillette',
        email: 'penn@mail.com',
        password: 'pass',
        password_confirmation: 'pass'
      )
    end

    it 'should return valid' do
      expect(@user.valid?).to eq(true)
    end

    it 'should return invalid if unmatching password & confirmation' do
      @user.password = 'pass'
      @user.password_confirmation = 'word'
      expect(@user.valid?).to eq(false)
    end

    it 'should return invalid if email not unique' do
      @user2 = @user.dup
      expect(@user2.valid?).to eq(false)
    end
  end
end
