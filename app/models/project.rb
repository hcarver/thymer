class Project < ActiveRecord::Base
  extend FriendlyId

  belongs_to :client

  validates :name, presence: true, uniqueness: {scope: :client}
  validates :client, presence: true

  friendly_id :name, use: :slugged
end
