class CreateProfilesToUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles_to_users do |t|
      t.string :user_username, null: false, default: ""
      t.string :user_fullName
      t.string :user_website
      t.string :user_phone
      t.string :user_gender
      t.string :user_avatar, null: false, default: "default_avatar.jpg"
      t.text   :user_biography

      t.timestamps
    end

    add_index :profiles_to_users, :user_username, unique: true
  end
end
