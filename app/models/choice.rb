# == Schema Information
#
# Table name: choices
#
#  id           :integer          not null, primary key
#  choice       :string(255)
#  correct      :boolean
#  explaination :string(255)
#  question_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Choice < ActiveRecord::Base
  belongs_to :question
  
  attr_accessible :choice, :correct, :explaination, :question_id  
  
  def to_label
		"#{id}"
	end
end
