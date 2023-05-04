class AddRecipeRefToRankings < ActiveRecord::Migration[7.0]
  def change
    add_reference :rankings, :recipe, null: false, foreign_key: true
  end
end
