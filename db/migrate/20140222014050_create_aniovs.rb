class CreateAniovs < ActiveRecord::Migration
  def change
    create_table :aniovs do |t|
      t.integer :modelo_id
      t.string :descripcion

      t.timestamps
    end
  end
end
