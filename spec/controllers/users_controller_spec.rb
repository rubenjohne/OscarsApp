require 'spec_helper'

describe UsersController do

  describe "UserPages" do
    
    describe "signup page" do
      
      before { visit signup_path }
      
      it "should be 'GET' successful" do
        response.should be_success 
      end
      
      
    end
    
  end
  
  

end
