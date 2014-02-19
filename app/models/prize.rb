# == Schema Information
#
# Table name: prizes
#
#  id         :integer          not null, primary key
#  pictureurl :string(255)
#  promocode  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Prize < ActiveRecord::Base
  attr_accessible :pictureurl, :promocode
  
	def to_label
		"#{id}"
	end
end
