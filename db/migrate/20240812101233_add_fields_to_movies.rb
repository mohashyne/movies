class AddFieldsToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :producer, :string
    add_column :movies, :net_worth, :string
    add_column :movies, :release_year, :string
    add_column :movies, :starts_at, :datetime
    add_column :movies, :description, :text
  end
end
