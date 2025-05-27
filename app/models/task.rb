class Task < ApplicationRecord
  acts_as_tenant :organization
  belongs_to :project, touch: true
  belongs_to :assignee, class_name: "User", optional: true
  has_many :noticed_events, as: :record, dependent: :destroy, class_name: "Noticed::Event"
  has_many :notifications, through: :noticed_events, class_name: "Noticed::Notification"
  validates :name, :duedate, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :project_id }
  # validate :duedate_is_futuristic
  validates :duedate, comparison: { greater_than: Date.current }
  enum :priority, { high: 0, medium: 1, low: 2 }
  after_update :update_completed_at
  # after_update :notify_urgent_tasks

  scope :incomplete_first, -> { order(completed_at: :desc) }
  scope :completed, -> { where(completed: true) }
  scope :urgent, -> { where(duedate: (Time.current..24.hours.from_now)).where(completed: false) }
  scope :expired, -> { where("duedate > ? AND completed = ?", Date.current, false) }
  scope :pending, -> { where("duedate < ? AND completed = ?", Date.current, false) }

  def notify_urgent_tasks
    UrgentTaskJob.perform_later
  end
  # def self.incomplete_first
  #   order(completed_at: :desc)
  # end
  # def self.completed
  #   where(completed: true)
  # end

  def urgent?
    (Time.current..24.hours.from_now).cover?(duedate) && !completed
  end

  def expired?
    duedate <Date.current && !completed
  end

  def update_completed_at
    if completed?
      update_column(:completed_at, Time.current)
    else
      update_column(:completed_at, nil)
    end
  end

  # def duedate_is_futuristic
  #   if duedate.present? && duedate<Date.current
  #     errors.add(:duedate, "must be in future")
  #   end
  # end

  def self.ransackable_attributes(auth_object = nil)
    [ "completed", "completed_at", "created_at", "duedate", "id", "name", "priority", "project_id", "updated_at" ]
  end
end
