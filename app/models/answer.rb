# == Schema Information
#
# Table name: answers
#
#  id         :integer          not null, primary key
#  date       :datetime
#  ipaddress  :string(255)
#  choice_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Answer < ActiveRecord::Base
	def to_label
		"#{id}"
	end
end
