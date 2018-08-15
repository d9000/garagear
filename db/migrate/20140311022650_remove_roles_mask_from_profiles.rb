class RemoveRolesMaskFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :roles_mask, :integer
  end
end
