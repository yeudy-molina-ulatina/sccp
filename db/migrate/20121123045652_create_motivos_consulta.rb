class CreateMotivosConsulta < ActiveRecord::Migration
  def change
    create_table :motivos_consulta do |t|
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
    add_index :motivos_consulta, :expediente_id
  end
end
