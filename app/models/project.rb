class Project < ActiveRecord::Base
  extend FriendlyId

  before_save :create_default_task, unless: :has_tasks?

  belongs_to :client
  has_many :tasks

  validates :name, presence: true, uniqueness: {scope: :client}
  validates :client, presence: true

  friendly_id :name, use: :slugged

  def has_tasks?
    return (not self.tasks.empty?)
  end

  def create_default_task
    self.tasks << Task.new(name: "Initial work")
  end
end
