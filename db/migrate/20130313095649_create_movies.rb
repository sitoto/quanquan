class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :director
      t.string :actor
      t.string :release_date
      t.string :thumb_image

      t.timestamps
    end
  end
end
