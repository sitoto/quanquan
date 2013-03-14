class AddColumnOutNumForRate < ActiveRecord::Migration
  def up
	add_column :rates, :out_num, :string
  end

  def down
  end
end
