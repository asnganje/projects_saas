class Project < ApplicationRecord
  acts_as_tenant :organization
  belongs_to :team
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  broadcasts_refreshes
end
