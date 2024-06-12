class Task < ApplicationRecord
  belongs_to :user
  enum status: { backlog: 0, in_progress: 1, done: 2 }

  validates :deadline, presence: true
  # validate :deadline_in_future

  private

  def deadline_in_future
    binding.pry
    if deadline.present? && deadline <= Date.today
      errors.add(:deadline, "must be in the future")
    end
  end
end