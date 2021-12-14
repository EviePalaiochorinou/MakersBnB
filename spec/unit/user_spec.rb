require 'user'
require 'bcrypt'

describe User do

  before do
    @user1 = User.create(email: 'test@test.com', password: 'qwerty', username: 'test')
  end

  describe '#create' do
    it 'creates a new user' do
      expect(@user1).to be_a User
      expect(@user1.email).to eq 'test@test.com'
    end  
  end

  describe "#find" do
    it "it finds the user based on the user's id" do
      result = User.find(id: @user1.id)

      expect(result.id).to eq @user1.id
      expect(result.email).to eq @user1.email
    end
  end
end

describe "#authenticate" do
  it "returns a user, given a correct email & password is provided" do
    user2 = User.create(email: 'test2@test.com', password: 'qwerty', username: 'test2')
    authenticated_user = User.authenticate(email: 'test2@test.com', password: 'qwerty')
    expect(authenticated_user.id).to eq user2.id
  end

  it "does not return a user, because the password is INCORRECT" do
    user3 = User.create(email: 'test3@test.com', password: 'qwerty', username: 'test3')
    non_authenticated_user = User.authenticate(email: 'test3@test.com', password: 'password')

    expect(non_authenticated_user).to be_nil
  end

end