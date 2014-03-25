class Log < ActiveRecord::Base
  BILLING_SIZE = 15

  belongs_to :task

  before_save :round_minutes

  validates :task, presence: true
  validates :time_minutes, presence: true
  validates :log_date, presence: true
  validates :notes, presence: true, blank: false

  def round_minutes
    billing_chunks = [1, self.time_minutes.to_f / BILLING_SIZE].max
    self.time_minutes = BILLING_SIZE * billing_chunks.round
  end
end
