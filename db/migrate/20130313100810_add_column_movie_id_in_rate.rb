class AddColumnMovieIdInRate < ActiveRecord::Migration
  def up
  	add_column :rates, :movie_id, :integer
  end

  def down
  end
end
