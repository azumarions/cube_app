class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :articles, [:user_id, :created_at]
  end
end
