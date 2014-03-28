class Client < ActiveRecord::Base
  extend FriendlyId

  before_save :create_default_project, unless: :has_projects?

  belongs_to :user
  has_many :projects

  validates :name, presence: true
  validates :user, presence: true

  friendly_id :name, use: :slugged

  def has_projects?
    return (not self.projects.empty?)
  end

  def create_default_project
    self.projects << Project.new(name: "Phase 1")
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
