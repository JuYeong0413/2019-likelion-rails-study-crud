class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.integer :view_count, default: 0

      t.timestamps
    end
  end
end
