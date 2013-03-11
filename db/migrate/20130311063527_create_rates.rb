class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :name
      t.string :rating
      t.string :from_url
      t.string :position

      t.timestamps
    end
  end
end
