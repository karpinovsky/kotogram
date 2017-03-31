class AddIndexWithUniquenessForAllColumnsToLikes < ActiveRecord::Migration[5.0]
  def change
    add_index :likes, [:likeable_type, :likeable_id, :liker], unique: true
  end
end
