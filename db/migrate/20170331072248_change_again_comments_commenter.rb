class ChangeAgainCommentsCommenter < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :comments do |t|
        dir.up   { t.change :commenter, :integer }
        dir.down { t.change :commenter, :string }
      end
    end
  end
end
