class AddColumnToDrinks < ActiveRecord::Migration[6.1]
  def change
    add_column :drinks, :measurements, :string
  end
end
