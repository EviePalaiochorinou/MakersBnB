require 'user'

describe User do
  describe '#create' do
    it 'creates a new user' do
	    user1 = User.create(email: 'test@test.com', password: 'qwerty', username: 'test')

      expect(user1).to be_a User
      expect(user1.email).to eq 'test@test.com'
    end  
  end
end

