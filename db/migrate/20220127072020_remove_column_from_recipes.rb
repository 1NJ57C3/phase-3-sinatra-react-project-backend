class RemoveColumnFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :measurements, :string
  end
end
