class CreateApiV3Movies < ActiveRecord::Migration[7.1]
  def change
    create_table :api_v3_movies do |t|
      t.string :name
      t.string :actor
      t.string :producer
      t.text :description
      t.decimal :net_worth
      t.datetime :starts_at
      t.decimal :price
      t.integer :release_year

      t.timestamps
    end
  end
end
