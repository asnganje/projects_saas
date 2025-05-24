class Team < ApplicationRecord
  acts_as_tenant :organization
end
