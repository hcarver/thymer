class Client < ActiveRecord::Base
  extend FriendlyId

  belongs_to :user

  validates :name, presence: true
  validates :user, presence: true

  friendly_id :name, use: :slugged
end
