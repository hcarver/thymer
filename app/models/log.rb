class Log < ActiveRecord::Base
  belongs_to :task

  validates :task, presence: true
  validates :time_minutes, presence: true
  validates :log_date, presence: true
end
