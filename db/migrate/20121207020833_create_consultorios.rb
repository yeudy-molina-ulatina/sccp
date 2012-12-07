class CreateConsultorios < ActiveRecord::Migration
  def change
    create_table :consultorios do |t|
      t.string :numero_consultorio
      t.string :horario
      t.string :proposito
      t.string :area
      t.references :citas

      t.timestamps
    end
    add_index :consultorios, :citas_id
  end
end
