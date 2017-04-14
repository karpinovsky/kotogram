class RemoveAvatarFromUsers < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :avatar, :string
  end

  def down
    add_column :users, :avatar, :string
  end
end
