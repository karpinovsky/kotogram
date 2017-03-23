class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.reference :post, index: true, foreign_key: true
      t.string  :image, null: false

      t.timestamps
    end
  end
end
