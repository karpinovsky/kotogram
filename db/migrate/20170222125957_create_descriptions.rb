class CreateDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :descriptions do |t|
      t.integer :post_id
      t.integer :user_id
      t.text    :body

      t.timestamps
    end
  end
end
