class Campaign < ApplicationRecord
  include Fae::BaseModelConcern
  def fae_display_field
    title
  end
  has_many :campaign_clients
  has_many :clients, through: :campaign_clients

  validates :title, presence: true
  validates :body, presence: true
end
