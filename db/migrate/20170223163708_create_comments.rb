class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :post_id,       null: false
      t.string  :user_username, null: false
      t.text    :body

      t.timestamps
    end
  end
end
