class CreateRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_ingredients do |t|
      t.string :quantity
      t.string :unit
      t.boolean :optional

      t.timestamps
    end
  end
end
