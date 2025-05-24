class AddOrganizationToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :organization_id, :integer
  end
end
