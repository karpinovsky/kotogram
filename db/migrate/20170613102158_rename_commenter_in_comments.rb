class RenameCommenterInComments < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :commenter, :user_id
  end
end
