class CreateCitas < ActiveRecord::Migration
  def change
    create_table :citas do |t|
      t.date :fecha
      t.time :hora
      t.integer :duracion
      t.string :lugar_atencion
      t.references :motivo_consulta

      t.timestamps
    end
    add_index :citas, :motivo_consulta_id
  end
end
