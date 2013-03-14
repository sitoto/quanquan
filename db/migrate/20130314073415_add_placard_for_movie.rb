class AddPlacardForMovie < ActiveRecord::Migration
  def up
  add_column :movies, :placard, :string
  end

  def down
  end
end
