class AddRecipesCounterToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :recipes_counter, :integer, :default => 0
  end
end
