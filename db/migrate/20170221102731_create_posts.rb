class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :user_id,       null: false
      t.string  :user_username, null: false
      t.text    :description,   limit: 255

      t.timestamps
    end
  end
end
