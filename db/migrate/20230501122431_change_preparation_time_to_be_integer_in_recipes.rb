class ChangePreparationTimeToBeIntegerInRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :preparation_time, :integer,  using: 'CAST(preparation_time AS integer)'
  end
end
