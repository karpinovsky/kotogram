class ChangeCommentsCommenter < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :comments do |t|
        dir.up   { t.change :commenter, :string }
        dir.down { t.change :commenter, :integer }
      end
    end
  end
end
