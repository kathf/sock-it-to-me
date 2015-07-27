class AddAvatarToSocks < ActiveRecord::Migration
  def change
    add_column :socks, :avatar, :string
  end
end
