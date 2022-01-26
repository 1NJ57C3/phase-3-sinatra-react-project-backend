class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :prep_type
      t.boolean :is_heated
      t.string :prep_time
      t.string :measurements
      t.string :instructions
    end
  end
end
