class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.references :post, foreign_key: true, index: true
      t.string :media

      t.timestamps
    end
  end
end
