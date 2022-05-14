class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :category_id
      t.integer :user_id
      t.string :photo
      t.string :prep
      t.string :cook
      t.string :direction
      t.string :ingredient
      t.timestamps
    end
    add_foreign_key :recipes, :users
    add_foreign_key :recipes, :categories
  end
end
