class Campaign < ApplicationRecord
  include Fae::BaseModelConcern
  def fae_display_field
    title
  end

  validates :title, presence: true
  validates :body, presence: true
end
