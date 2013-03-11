class Rate < ActiveRecord::Base
  attr_accessible :from_url, :name, :position, :rating, :site, :movie_id
end
