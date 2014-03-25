class OutsourcedTask < ActiveRecord::Base
  extend FriendlyId

  validates :name, presence: true, uniqueness: {scope: :project}
  validates :project, presence: true

  friendly_id :name, use: :slugged

  monetize :estimated_cost_pennies
  monetize :actual_cost_pennies, allow_nil: true
  monetize :charged_to_client_pennies

  belongs_to :project
end
