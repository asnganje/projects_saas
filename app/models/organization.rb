class Organization < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :users
end
