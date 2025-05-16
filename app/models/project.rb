class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
