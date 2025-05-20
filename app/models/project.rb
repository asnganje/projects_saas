class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  broadcasts_refreshes
end
