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
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
    
  end
  
end