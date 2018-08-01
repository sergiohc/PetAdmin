class Product < ApplicationRecord
  include Fae::BaseModelConcern
  has_fae_image :hero_image

  def fae_display_field
    title
  end

  belongs_to :supplier

  validates :title, uniqueness: true, presence: true
  validates :price, presence: true
end
