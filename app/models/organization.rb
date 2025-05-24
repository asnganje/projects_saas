class Organization < ApplicationRecord
  before_validation :downcase_subdomain
  belongs_to :owner, class_name: "User"
  has_many :users

  private
  def downcase_subdomain
    self.subdomain = subdomain.downcase if subdomain.present?
  end
end
