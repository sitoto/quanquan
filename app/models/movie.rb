class Movie < ActiveRecord::Base
  attr_accessible :actor, :director, :name, :release_date, :thumb_image
  
  has_many :rates
end
