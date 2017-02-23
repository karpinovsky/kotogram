class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string  :user_username
      t.text    :body

      t.timestamps
    end
  end
end
