require 'spec_helper'

describe "User Pages" do
  
  subject { page }
  
  describe "profile page" do 
    
    let(:user) { User.find_by(email: FactoryGirl.build(:user).email) }
    
    before { visit user_path(user) }
    
    it { should have_selector('h1', text: user.name ) }
    
  end
  
  describe "signup", :broken => true do
    before { visit signup_path }
    let(:submit) { "Create User" }
    
    describe "with invalid information" do
      it "should not create user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
    
    describe "with valid information", :broken => true do
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
  
  describe "edit" do
    let(:user) {  User.find_by(email: FactoryGirl.build(:user).email) }
    before do 
      sign_in user 
      visit edit_user_path(user)
    end
    
    describe "page" do 
      it { should have_selector('h1', text: "Editing user") }
    end
    
    describe "with invalid information" do
      before { click_button "Create User"}
      
      it { should have_content('error') }
    end
    
    describe "with valid information", :broken => true do
      let(:new_name) { "New Name" }
      let(:new_email) { "new@example.com"}
      before do 
        fill_in "Name",               with: new_name
        fill_in "Email",              with: new_email 
        fill_in "Password",           with: user.password
        fill_in "Confirmation",       with: user.password
        click_button "Create User"
      end
      
      it { should have_selector('h1', text: new_name) }
      it { should have_link('Sign out', href: signout_path) }
      specify { user.reload.name.should == new_name }
      specify { user.reload.email.should == new_email }
      
    end
  end
  
end