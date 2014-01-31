# == Schema Information
#
# Table name: answers
#
#  id             :integer          not null, primary key
#  date           :datetime
#  ipaddress      :string(255)
#  choice_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#  participant_id :integer
#

class Answer < ActiveRecord::Base
  attr_accessible :participant_id, :date, :ipaddress, :choice_id

	def to_label
		"#{id}"
	end
end
