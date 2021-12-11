class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :resource
      t.text :content
      t.string :resource_type
      t.references :parent_comment

      t.timestamps
    end
  end
end
