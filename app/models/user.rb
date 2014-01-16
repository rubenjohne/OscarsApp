# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  password   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email 
  
  VALID_EMAIL_REGEX = /\ A[\ w +\-.] +@[ a-z\ d\-.] +\.[ a-z] +\ z/i

  validates :name, presence: true
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

end
