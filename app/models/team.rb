class Team < ApplicationRecord
  acts_as_tenant :organization
  has_many :team_members
  has_many :users, through: :team_members
end
