class Attachment < ApplicationRecord
  belongs_to :attachmentable, polymorphic: true
  has_one_attached :file
  # validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
end
