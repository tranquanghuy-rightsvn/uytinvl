class CreateUsersChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :users_channels do |t|
      t.integer :role, default: 0
      t.references :user, null: false
      t.references :channel, null: false

      t.timestamps
    end
  end
end
