require 'spec_helper'

describe "Authentication" do
  
  subject { page }
  
  describe "signin page" do
    before { visit signin_path }
    
    it { should have_selector('h1', text: 'Sign in') }
    
  end
  
  describe "signin" do 
    before { visit signin_path }
    
    describe "with invalid information" do 
      before { click_button "Sign in" }
      
      it { should have_selector('h1', text:'Sign in') }
    end
    
    describe "with valid information" do 
      let(:user) { User.find_by(email: FactoryGirl.build(:user).email) }
      before do 
        fill_in "Email",    with: "ruben@tadashishoji.com"
        fill_in "Password", with: "foobar"
        click_button "Sign in"
      end
      
      it { should have_selector('h1', text: user.name) }
      it { should have_link('Settings', href: edit_user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
    
  end
  
  describe "authorization" do
    let(:user) { User.find_by(email: FactoryGirl.build(:user).email) }
    
    describe "in the Users controller" do
      
      describe "visiting the edit page" do
        before { visit edit_user_path(user) }
        it { should have_selector('h1', text: 'Sign in') }
      end
      
      describe "submitting to the update action" do 
        before { put user_path(user) }
        specify { response.should redirect_to(signin_path) }
      end
    end
    
  end
  
end