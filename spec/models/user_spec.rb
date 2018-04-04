require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){create(:user)}
  
  it 'exists and can be instantiated' do
    expect(User.create(email: "some@email.com", password: "password")).to be_valid
  end
  
  describe "attributes" do

    it 'has an email' do
      expect(user.email).to eq("test@test.com")
    end
    
    it 'has a password' do
      expect(user.password).to eq("testtest")
    end
  end
end
