class AddColumnsToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :source, :string
    add_column :recipes, :image, :string
  end
end
