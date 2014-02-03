require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do

    it "should be successful" do
      get 'home'
      response.should be_success
    end

  end

  describe "GET 'contest'"  do

    it "should redirect to home if the user didn't sign up" do
      get 'contest'
      response.should redirect_to root_path
    end

  end

  describe "POST 'signup'" do

    it "should redirect back to home if the user didn't agree to terms"
    it "should not create the Participant if it already exist"
  end
  
  describe "POST 'answer'" do
    
    it "should save the answer"
    
    it "GET should not be successful" do
      get 'answer'
      response.should_not be_success
    end
    
  end

end
