class ChangeCookingTimeToBeIntegerInRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :cooking_time, :integer,  using: 'CAST(cooking_time AS integer)'
  end
end
