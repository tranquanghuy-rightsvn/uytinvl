class CreateNotificationGroupUser < ActiveRecord::Migration[6.1]
  def change
    create_table :notification_group_users do |t|
      t.references :notification, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
