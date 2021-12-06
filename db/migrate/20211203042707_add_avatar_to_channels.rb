class AddAvatarToChannels < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :avatar, :string
  end
end
