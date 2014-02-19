# == Schema Information
#
# Table name: winners
#
#  id             :integer          not null, primary key
#  participant_id :integer
#  price_id       :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Winner < ActiveRecord::Base
  attr_accessible :participant_id, :price_id
  
end
