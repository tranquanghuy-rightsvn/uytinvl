class CreateChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :detail
      t.references :user, null: false

      t.timestamps
    end
  end
end
