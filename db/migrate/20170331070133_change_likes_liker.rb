class ChangeLikesLiker < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :likes do |t|
        dir.up   { t.change :liker, :integer }
        dir.down { t.change :liker, :string }
      end
    end
  end
end
