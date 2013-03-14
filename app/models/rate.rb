class Rate < ActiveRecord::Base
  attr_accessible :from_url, :name, :position, :rating, :site, :movie_id, :out_num
  
  belongs_to :movie
end
