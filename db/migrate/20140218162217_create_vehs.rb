class CreateVehs < ActiveRecord::Migration
  def change
    create_table :vehs do |t|
      t.string :dominio
      t.integer :profile_id

      t.timestamps
    end
  end
end
