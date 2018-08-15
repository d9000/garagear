class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :aniodefab_id
      t.string :descripcion

      t.timestamps
    end
  end
end
