class AddRecipeRefToSavedRecipes < ActiveRecord::Migration[7.0]
  def change
    add_reference :saved_recipes, :recipe, null: false, foreign_key: true
  end
end
