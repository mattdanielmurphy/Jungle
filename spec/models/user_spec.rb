require 'rails_helper'

describe User, type: :model do
  before(:each) do
    @user = User.create(
      firstname: 'Famous',
      lastname: 'Mortimer',
      email: 'famous@mail.com',
      password: 'strong_password',
      password_confirmation: 'strong_password'
    )
  end

  describe 'Validations:' do
    it 'should validate' do
      expect(@user.valid?).to eq(true)
    end

    context 'Password:' do
      it 'should not validate if password & confirmation don\'t match' do
        @user.password              = 'xxxxxxxxxxx'
        @user.password_confirmation = 'zzzzzzzzzz'
        expect(@user.valid?).to eq(false)
      end

      it 'should not validate if password less than 10 characters long' do
        @user.password = @user.password_confirmation = 'shortpass'
        expect(@user.valid?).to eq(false)
      end
    end

    it 'should not validate if email non-unique' do
      @user2 = @user.dup
      expect(@user2.valid?).to eq(false)
    end
  end

  describe '.authenticate_with_credentials:' do
    def authenticate(email, password)
      User.authenticate_with_credentials(email, password)
    end

    it 'should authenticate if credentials correct' do
      expect(
        authenticate('famous@mail.com', 'strong_password')
      ).to_not be_nil
    end

    it 'should not authenticate if password incorrect' do
      expect(
        authenticate('famous@mail.com', 'wrong_password')
      ).to be_nil
    end

    it 'should not authenticate if email incorrect' do
      expect(
        authenticate('wrong@email.com', 'strong_password')
      ).to be_nil
    end

    context 'edge cases:' do
      it 'should authenticate if email different case' do
        expect(
          authenticate('FaMouS@MaIL.COm', 'strong_password')
        ).to_not be_nil
      end

      it 'should authenticate if email has leading/trailing spaces' do
        expect(
          authenticate('  famous@mail.com   ', 'strong_password')
        ).to_not be_nil
      end
    end
  end
end
