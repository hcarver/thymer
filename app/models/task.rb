class Task < ActiveRecord::Base
  extend FriendlyId

  belongs_to :project

  validates :name, presence: true, uniqueness: {scope: :project}
  validates :project, presence: true

  friendly_id :name, use: :slugged
end
