class AddOtherColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string
    add_column :users, :public_name, :string
  end
end
