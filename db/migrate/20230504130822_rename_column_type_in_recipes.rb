class RenameColumnTypeInRecipes < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :type, :recipe_type
  end
end
