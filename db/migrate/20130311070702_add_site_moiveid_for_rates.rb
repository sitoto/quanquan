class AddSiteMoiveidForRates < ActiveRecord::Migration
  def up
	add_column :rates, :site, :string
	add_column :rates, :movie_id, :string
  end

  def down
  end
end
