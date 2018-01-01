class DropImages < ActiveRecord::Migration[5.0]
  def change
    drop_table :images do |t|
      t.string :avatar
      t.references :post
    end
  end
end
