require 'spec_helper'

describe "User Pages" do
  
  subject { page }
  
  describe "profile page" do 
    
    let(:user) { User.find_by(email: FactoryGirl.build(:user).email) }
    
    before { visit user_path(user) }
    
    it { should have_selector('h1', text: user.name ) }
    
  end
  
  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create User" }
    
    describe "with invalid information" do
      it "should not create user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
    
    describe "with valid information" do
      before do 
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end  
      
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
    end
    
  end
  
end