class CreateClocks < ActiveRecord::Migration[6.0]
  def change
    create_table :clocks do |t|
      t.integer :user_id, null: false
      t.string :hour
      t.string :minute
      t.string :second
      t.string :millisecond

      t.timestamps

      t.index :user_id
    end
  end
end
