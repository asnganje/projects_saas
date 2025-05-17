class Task < ApplicationRecord
  belongs_to :project
  validates :name, :duedate, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :project_id }
  validate :duedate_is_futuristic
  enum :priority, { high: 0, medium: 1, low: 2 }
  after_update :update_completed_at

  scope :incomplete_first, -> { order(completed_at: :desc) }
  scope :completed, -> { where(completed: true) }
  # def self.incomplete_first
  #   order(completed_at: :desc)
  # end
  # def self.completed
  #   where(completed: true)
  # end
  def update_completed_at
    if completed?
      update_column(:completed_at, Time.current)
    else
      update_column(:completed_at, nil)
    end
  end

  def duedate_is_futuristic
    if duedate.present? && duedate<Date.today
      errors.add(:duedate, "must be in future")
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["completed", "completed_at", "created_at", "duedate", "id", "name", "priority", "project_id", "updated_at"]
  end

end
