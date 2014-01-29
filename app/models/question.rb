class Question < ActiveRecord::Base
  belongs_to :day
  has_many :choices
end
