class User < ApplicationRecord
  ROLES = [ :team_leader, :team_member ]
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :projects
  has_one :owned_organization, class_name: "Organization", foreign_key: :owner_id, inverse_of: :owner, dependent: :destroy
  has_many :tasks, through: :projects
  has_many :notifications, as: :recipient, dependent: :destroy, class_name: "Noticed::Notification"
  belongs_to :organization, optional: true
  accepts_nested_attributes_for :owned_organization, reject_if: :all_blank
  after_create :assign_default_role
  before_create :set_organization, if: :created_by_invite?

  def organization_owner?
    owned_organization.present?
  end

  def assign_default_role
    add_role(:team_member) if self.roles.blank?
  end

  def set_organization
    self.organization_id = invited_by.owned_organization.id
  end
end
