class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.references :recipes
      t.references :ingredients
    end
  end
end
