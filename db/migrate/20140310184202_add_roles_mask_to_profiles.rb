class AddRolesMaskToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :roles_mask, :integer
  end
end
