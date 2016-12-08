describe 'User' do
  let(:user) { User.new(
    username:  'NewUserName', 
    email: 'test@domain.com',
    password: 'somePassword!'
    )}

  describe 'Attributes' do
    it 'is valid with a new instance' do
      expect(user).to be_valid
    end

    it 'is not valid to create a new instance without required attributes' do
      expect(User.new).to_not be_valid
    end

    it 'can read and write to :username' do
      user.username = 'test_user'
      expect(user.username).to eq('test_user')
    end

    it 'can read and write to :email' do
      user.email = 'test_email@testdomain.com'
      expect(user.email).to eq('test_email@testdomain.com')
    end

    it 'is valid with a password between 8 and 20 characters' do
      expect(user.password.length).to be_between(8, 20).inclusive
    end
    
    it 'is not valid with a password outside of 8 and 20 characters' do
      user.password = 'asd'
      expect(user.password.length).to_not be_between(8, 20).inclusive
    end

    it 'can read and write to :salt' do
      user.salt = '@@!!yytt'
      expect(user.salt).to eq('@@!!yytt')
    end

    it 'can read and write to :hashed_password' do
      user.hashed_password = '1234567890!@#$%^&*()'
      expect(user.hashed_password).to eq('1234567890!@#$%^&*()')
    end
    
    it 'is valid when username length is between 8 and 20 characters' do
      expect(user.username.length).to be_between(8, 20).inclusive
    end

    it 'is not valid when username length is less than 8 or greater than 20 characters' do
      user.username = 'user'
      expect(user.username.length).to_not be_between(8, 20).inclusive
    end

    it 'creates a hashed password' do
      user.encrypt_password
      #puts user.encrypt_password
      expect(user.hashed_password).to_not be_nil
    end

    it 'does not create a hashed password for an invalid password' do
      user.password = nil
      user.encrypt_password
      expect(user.hashed_password).to be_nil
    end
  end
end
