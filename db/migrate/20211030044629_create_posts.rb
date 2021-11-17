class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :title, null: false
      t.text :content, null: false
      t.boolean :lock_comment, default: false
      t.references :category, null: false
      t.references :user, null: false
      
      t.timestamps
    end
  end
end
