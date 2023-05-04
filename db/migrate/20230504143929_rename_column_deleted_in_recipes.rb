class RenameColumnDeletedInRecipes < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :deleted, :deleted_recipe
  end
end
