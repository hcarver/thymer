class Project < ActiveRecord::Base
  extend FriendlyId

  belongs_to :client
  has_many :tasks

  validates :name, presence: true, uniqueness: {scope: :client}
  validates :client, presence: true

  friendly_id :name, use: :slugged
end
