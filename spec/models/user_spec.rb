require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  it { is_expected.to validate_presence_of(:firstname) }
  it { is_expected.to validate_length_of(:firstname).is_at_least(1) }
  
  it { is_expected.to validate_presence_of(:lastname) }
  it { is_expected.to validate_length_of(:lastname).is_at_least(1) }
  
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }
  it { is_expected.to allow_value("user@bloccit.com").for(:email) }
  
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }
  
  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(firstname: user.firstname, lastname: user.lastname, email: user.email)
    end
  end
  
  describe "invalid user" do
    let(:user_with_invalid_firstname) { build(:user, firstname: "") }
    let(:user_with_invalid_lastname) { build(:user, lastname: "") }
    let(:user_with_invalid_email) { build(:user, email: "") }
    
    it "should be an invalid user due to blank name" do
      expect(user_with_invalid_firstname).to_not be_valid
    end
    
    it "should be an invalid user due to blank name" do
      expect(user_with_invalid_lastname).to_not be_valid
    end
      
    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end
  end
  
end