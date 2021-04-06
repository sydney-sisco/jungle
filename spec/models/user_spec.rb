require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should save when all fields are valid' do
      user = User.create(
        :first_name => 'Dude',
        :last_name => 'McTester',
        :email => 'dude@tester.com',
        :password => '123123123',
        :password_confirmation => '123123123'
      )

      expect(user).to be_valid
    end

    it 'should validate presence of email' do
      user = User.create(
        :first_name => 'Dude',
        :last_name => 'McTester',
        # :email => 'dude@tester.com',
        :password => '123123123',
        :password_confirmation => '123123123'
      )

      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include 'Email can\'t be blank'
    end
    
    it 'should validate presence of first name' do
      user = User.create(
        # :first_name => 'Dude',
        :last_name => 'McTester',
        :email => 'dude@tester.com',
        :password => '123123123',
        :password_confirmation => '123123123'
      )
  
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include 'First name can\'t be blank'
    end
    
    it 'should validate presence of last name' do
      user = User.create(
        :first_name => 'Dude',
        # :last_name => 'McTester',
        :email => 'dude@tester.com',
        :password => '123123123',
        :password_confirmation => '123123123'
      )
  
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include 'Last name can\'t be blank'
    end

    it 'should validate presence of password' do
      user = User.create(
        :first_name => 'Dude',
        :last_name => 'McTester',
        :email => 'dude@tester.com',
        # :password => '123123123',
        :password_confirmation => '123123123'
      )
  
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include 'Password can\'t be blank'
    end

    it 'should validate presence of password_confirmation' do
      user = User.create(
        :first_name => 'Dude',
        :last_name => 'McTester',
        :email => 'dude@tester.com',
        :password => '123123123',
        # :password_confirmation => '123123123'
      )
  
      expect(user).to_not be_valid
      # expect(user.errors.full_messages).to include 'Password can\'t be blank'
    end

    it 'should validate password and password_confirmation match' do

    end

    it 'should not allow duplicate email addresses' do
      user1 = User.create(
        :first_name => 'Dude',
        :last_name => 'McTester',
        :email => 'dude@tester.com',
        :password => '123456789',
        :password_confirmation => '123456789'
      )

      user2 = User.create(
        :first_name => 'Dude',
        :last_name => 'McTester Jr',
        :email => 'dude@tester.COM',
        :password => '123456789',
        :password_confirmation => '123456789'
      )

      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include 'Email has already been taken'

    end

    it 'should validate password length' do
      user = User.create(
        :first_name => 'Dude',
        :last_name => 'McTester',
        :email => 'dude@tester.com',
        :password => '123',
        :password_confirmation => '123'
      )
  
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include 'Password is too short (minimum is 8 characters)'
    end
  end
end
