class CreatePostsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :posts_tags, id: false do |t|
      t.reference :post, index: true, foreign_key: true
      t.reference :tag,  index: true, foreign_key: true
    end
  end
end
