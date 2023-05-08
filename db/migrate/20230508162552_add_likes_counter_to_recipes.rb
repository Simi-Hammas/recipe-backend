class AddLikesCounterToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :likes_counter, :integer
  end
end
