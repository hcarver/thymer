class Task < ActiveRecord::Base
  extend FriendlyId

  scope :incomplete, where(completed: false)

  belongs_to :project
  has_many :logs

  validates :name, presence: true, uniqueness: {scope: :project}
  validates :project, presence: true

  friendly_id :name, use: :slugged

  def minutes_logged
    logs.sum(:time_minutes)
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
