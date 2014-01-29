# == Schema Information
#
# Table name: days
#
#  id         :integer          not null, primary key
#  dayname    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Day < ActiveRecord::Base
	has_many :questions
	def to_label
		"#{dayname}"
	end
end
