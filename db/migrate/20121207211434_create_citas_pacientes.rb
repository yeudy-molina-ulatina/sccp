class CreateCitasPacientes < ActiveRecord::Migration
  def change
    create_table :citas_pacientes, :id => false do |t|
      t.references :cita
      t.references :paciente
    end
    add_index :citas_pacientes, :cita_id
    add_index :citas_pacientes, :paciente_id
  end
end