class AddContentTypeToAttachments < ActiveRecord::Migration[5.0]
  def change
    add_column :attachments, :content_type, :string
  end
end
