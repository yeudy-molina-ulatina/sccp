class CreateAsignaciones < ActiveRecord::Migration
  def change
    create_table :asignaciones do |t|
      t.references :usuario
      t.references :motivo_consulta
      t.date :fecha_inicio
      t.date :fecha_final
      t.string :tipo_asignacion

      t.timestamps
    end
    add_index :asignaciones, :usuario_id
    add_index :asignaciones, :motivo_consulta_id
  end
end
