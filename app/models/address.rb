class Address < ApplicationRecord
  include Fae::BaseModelConcern

  def fae_display_field
    id
  end

  def self.for_fae_index
    order(:id)
  end
  
  validates :street, presence: true
  validates :district, presence: true
  validates :zipcode, presence: true
  validates :state, presence: true
  validates :city, presence: true

  validates :client, presence: true
  belongs_to :client
end
