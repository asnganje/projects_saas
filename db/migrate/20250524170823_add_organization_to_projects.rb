class AddOrganizationToProjects < ActiveRecord::Migration[8.0]
  def change
    add_reference :projects, :organization, null: false, foreign_key: true
    add_reference :projects, :team, null: true, foreign_key: true
    remove_reference :projects, :user, null: true, foreign_key: true
  end
end
