class AddUserUsernameToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :user_username, :string
  end
end
