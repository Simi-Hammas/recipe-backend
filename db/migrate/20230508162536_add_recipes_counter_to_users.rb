class AddRecipesCounterToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :recipes_counter, :integer
  end
end
