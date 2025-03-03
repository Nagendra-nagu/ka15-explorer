class Post < ApplicationRecord
    belongs_to :user
    # has_many :comments, dependent: :destroy
    # has_many :likes, as: :likeable, dependent: :destroy
    # has_many :post_tags, dependent: :destroy
    # has_many :tags, through: :post_tags
    # has_many :post_categories, dependent: :destroy
    # has_many :categories, through: :post_categories
    has_many :attachments, as: :attachmentable, dependent: :destroy
    accepts_nested_attributes_for :attachments, allow_destroy: true
  
    validates :title, presence: true
    validates :body, presence: true
    validates :position, presence: true, numericality: { only_integer: true }, uniqueness: true

    enum status: { draft: 1, published: 2, archived: 3 }

  def image_url
        image = self.attachments.last
        if image.present? && image.file.attached?
          Rails.application.routes.url_helpers.rails_representation_url(image.file, only_path: true)
        end
    end
end
