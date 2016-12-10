describe 'User' do
  let(:user) { User.create!(
    name:  'NewUserName', 
    email: 'test@domain.com',
    password: 'somePassword!',
    password_confirmation: 'somePassword!'
    ) }

  describe 'Attributes' do
    it 'is valid with a new instance' do
      expect(user).to be_valid
    end

    it 'is not valid to create a new instance without required attributes' do
      expect(User.new()).to_not be_valid
    end

    it 'can read and write to :name' do
      user.name = 'test_user'
      expect(user.name).to eq('test_user')
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
  end

  describe 'Authentication' do
    it 'authenticates with the correct password' do
      expect(user.authenticate('somePassword!')).to be_valid
    end

    it 'is not valid authentication with incorrect password' do
      expect(user.authenticate('some!')).to be_falsey
    end
  end
end
