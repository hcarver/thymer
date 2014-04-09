class Project < ActiveRecord::Base
  extend FriendlyId

  before_save :create_default_task, unless: :has_tasks?

  belongs_to :client
  has_many :tasks
  has_many :outsourced_tasks

  validates :name, presence: true, uniqueness: {scope: :client}
  validates :client, presence: true

  friendly_id :name, use: :slugged

  def quote_estimate
    (((total_estimate || 0) / (60*60*7.5)) * (rate || 0)).to_money
  end

  def total_estimate
    self.tasks.map {|x| x.estimated_minutes}.sum.minutes
  end

  def has_tasks?
    return (not self.tasks.empty?)
  end

  def create_default_task
    self.tasks << Task.new(name: "Initial work")
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
