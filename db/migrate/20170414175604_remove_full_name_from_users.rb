class RemoveFullNameFromUsers < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :full_name, :string
  end

  def down
    add_column :users, :full_name, :string
  end
end
