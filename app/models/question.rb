# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :string(255)
#  day_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  belongs_to :day
  has_many :choices
  
  attr_accessible :question, :day_id, :num
  
  
  def to_label
		"#{question}"
	end
end
