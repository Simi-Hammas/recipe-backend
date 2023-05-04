class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :method
      t.string :preparation_time
      t.string :cooking_time
      t.string :ease_of_preparation
      t.text :notes
      t.string :photo
      t.json :type
      t.string :country
      t.boolean :accessible
      t.boolean :deleted

      t.timestamps
    end
  end
end
