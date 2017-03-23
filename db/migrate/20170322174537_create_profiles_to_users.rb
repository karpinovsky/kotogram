class CreateProfilesToUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles_to_users, id: false do |t|
      t.references :user, index: true, foreign_key: true
      t.string :user_username, null: false, default: ''
      t.string :user_fullName
      t.string :user_website
      t.string :user_phone
      t.string :user_gender
      t.string :user_avatar, null: false, default: 'default_avatar.jpg'
      t.text   :user_about_me

      t.timestamps
    end

    add_index :profiles_to_users, :user_username, unique: true
    add_index :profiles_to_users, :user_phone,    unique: true
  end
end
