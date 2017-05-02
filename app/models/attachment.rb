class Attachment < ApplicationRecord
  belongs_to :post
  mount_uploader :media, AttachmentUploader
end
