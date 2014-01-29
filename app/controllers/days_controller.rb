class DaysController < ApplicationController
  active_scaffold :"day" do |conf|
  	config.label = "Days"
  	config.columns = [:dayname, :questions, :created_at, :updated_at]
  end
end
