class AddCommentsCounterToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :comments_counter, :integer
  end
end
