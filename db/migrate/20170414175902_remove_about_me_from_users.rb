class RemoveAboutMeFromUsers < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :about_me, :text
  end

  def down
    add_column :users, :about_me, :text
  end
end
