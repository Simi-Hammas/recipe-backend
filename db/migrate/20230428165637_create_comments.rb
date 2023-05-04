class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :comment_text
      t.boolean :deleted

      t.timestamps
    end
  end
end
