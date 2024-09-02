class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :actor
      t.decimal :price

      t.timestamps
    end
  end
end
