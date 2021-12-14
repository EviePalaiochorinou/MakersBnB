require 'user'

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
  

end