class AddPrivstatusToVehs < ActiveRecord::Migration
  def change
    add_column :vehs, :privstatus, :string
  end
end
