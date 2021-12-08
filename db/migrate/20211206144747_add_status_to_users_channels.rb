class AddStatusToUsersChannels < ActiveRecord::Migration[6.1]
  def change
    add_column :users_channels, :status, :integer, default: 0
  end
end
