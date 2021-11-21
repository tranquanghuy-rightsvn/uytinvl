class CreateTagsPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :tags_posts do |t|
      t.references :tag, null: false
      t.references :post

      t.timestamps
    end
  end
end
