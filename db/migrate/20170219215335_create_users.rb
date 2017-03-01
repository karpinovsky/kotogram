class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username, null: false
      t.string :website
      t.text   :bio
      t.string :phone
      t.string :gender

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
