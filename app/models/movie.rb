class Movie < ActiveRecord::Base
  attr_accessible :actor, :director, :name, :release_date, :thumb_image, :placard_cache,  :remove_placard, :remote_placard_url
  
   mount_uploader :placard, PlacardUploader
   
  has_many :rates
end
