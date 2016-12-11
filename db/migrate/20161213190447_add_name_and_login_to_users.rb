class AddNameAndLoginToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name,  :string, null: false, default: ""
    add_column :users, :login, :string, null: false, default: ""
    add_index  :users, :login, unique: true
  end
end
