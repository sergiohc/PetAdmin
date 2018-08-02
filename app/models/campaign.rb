class Campaign < ApplicationRecord
  include Fae::BaseModelConcern
  def fae_display_field
    title
  end

  has_many :campaign_clients, dependent: :destroy
  has_many :clients, through: :campaign_clients

  validates :title, presence: true
  validates :body, presence: true

  after_save :schedule_emails
 
  def fae_display_field
    title
  end
 
  def schedule_emails
    Client.find_each do |client|
      CampaignClient.create(campaign: self, client: client)
      CampaingJob.perform_later client, self.title, self.body
    end
  end
end
