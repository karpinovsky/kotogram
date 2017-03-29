class ChangeIntegerTypeForCommenter < ActiveRecord::Migration[5.0]
  def up
    change_column :comments, :commenter, :string
  end

  def down
    change_column :comments, :commenter, :integer
  end
end
