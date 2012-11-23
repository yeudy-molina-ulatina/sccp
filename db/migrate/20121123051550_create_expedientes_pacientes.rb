class CreateExpedientesPacientes < ActiveRecord::Migration
  def change
    create_table :expedientes_pacientes, :id => false do |t|
      t.integer :expediente_id
      t.integer :paciente_id
    end
    add_index :expedientes_pacientes, :expediente_id
    add_index :expedientes_pacientes, :paciente_id
  end
end