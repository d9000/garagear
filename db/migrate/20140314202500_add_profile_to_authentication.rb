class AddProfileToAuthentication < ActiveRecord::Migration
  def change
    add_column :authentications, :profile_id, :integer
  end
end
