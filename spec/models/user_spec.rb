require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){ create(:user) }
  
  it 'exists and can be instantiated' do
    expect(user).to be_valid
  end
  
  describe "attributes" do

    it 'has an email' do
      expect(user.email).to eq("test@test.com")
    end

    it 'has a password' do
      expect(user.password).to eq("testtest")
    end
    
    it 'has a first name' do
      expect(user.first_name).to eq("test")
    end
    
    it 'has a last name' do
      expect(user.last_name).to eq("test")
    end
    
    it 'has a unique email' do
      user
      user2 = build(:bad_account)
      expect(user2).to_not be_valid
    end
    
    it 'is invalid without an email' do
      user2 = User.create(password: "testtest", first_name: "test", last_name: "test")
      expect(user2).to_not be_valid
    end
    
    it 'is invalid without a password' do
      user2 = User.create(email: "test2@test.com", first_name: "test", last_name: "test")
      expect(user2).to_not be_valid
    end
    
    it 'is invalid without a first name' do
      user2 = User.create(email: "test2@test.com", password: "testtest", last_name: "test")
      expect(user2).to_not be_valid
    end
    
    it 'is invalid without a last name' do
      user2 = User.create(email: "test2@test.com", password: "testtest", first_name: "test")
      expect(user2).to_not be_valid
    end
  end
end
