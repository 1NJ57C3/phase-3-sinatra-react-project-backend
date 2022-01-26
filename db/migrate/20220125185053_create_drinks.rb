class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.references :recipe
      t.references :ingredient
    end
  end
end
