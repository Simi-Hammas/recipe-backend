class CreateSavedRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_recipes do |t|
      t.boolean :saved
      t.text :notes

      t.timestamps
    end
  end
end
