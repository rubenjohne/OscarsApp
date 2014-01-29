# == Schema Information
#
# Table name: participants
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  subscribed :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Participant < ActiveRecord::Base
	def to_label
		"#{id}"
	end
end
