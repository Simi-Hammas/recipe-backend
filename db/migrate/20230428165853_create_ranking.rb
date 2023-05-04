class CreateRanking < ActiveRecord::Migration[7.0]
  def change
    create_table :rankings do |t|
      t.integer :stars

      t.timestamps
    end
  end
end
