class AddIngredientRefToRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_ingredients, :ingredient, null: false, foreign_key: true
  end
end
