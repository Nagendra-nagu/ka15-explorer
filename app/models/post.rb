class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, as: :likeable, dependent: :destroy
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
    has_many :post_categories, dependent: :destroy
    has_many :categories, through: :post_categories
  
    validates :title, presence: true
    validates :body, presence: true
end
