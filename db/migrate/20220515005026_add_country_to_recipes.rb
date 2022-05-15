class AddCountryToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :country, :string
  end
end
