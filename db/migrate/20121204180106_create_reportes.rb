class CreateReportes < ActiveRecord::Migration
  def change
    create_table :reportes do |t|
      t.text :temas_discutidos
      t.text :actividades_realizadas
      t.text :acuerdos
      t.string :tipo
      t.text :tratamiento
      t.string :diagnostico
      t.references :cita

      t.timestamps
    end
    add_index :reportes, :cita_id
  end
end
