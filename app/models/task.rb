class Task < ApplicationRecord
  belongs_to :project
  enum :priority, {high:0, medium:1, low:2}
end
