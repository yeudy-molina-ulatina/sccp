class CreateMotivoConsulta < ActiveRecord::Migration
  def change
    create_table :motivo_consulta do |t|
      t.string :motivo_inicial
      t.string :motivo_real
      t.string :derivacion
      t.string :estado
      t.date :fecha_inicio
      t.date :fecha_fin
      t.string :nivel_importancia
      t.references :expediente

      t.timestamps
    end
    add_index :motivo_consulta, :expediente_id
  end
end
