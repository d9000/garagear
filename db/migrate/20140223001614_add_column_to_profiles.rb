class AddColumnToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :lname, :string
  end
end
