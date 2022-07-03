class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :allergy
  has_rich_text :description
  has_one_attached :image
end
