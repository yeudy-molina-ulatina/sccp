class CreatePacientes < ActiveRecord::Migration
  def change
    create_table :pacientes do |t|
      t.string :cedula
      t.string :nombre
      t.string :apellido1
      t.string :apellido2
      t.date :fecha_nacimiento
      t.string :genero
      t.string :estado_civil
      t.string :provincia
      t.string :canton
      t.string :distrito
      t.text :otras_senas
      t.string :telefono_casa
      t.string :telefono_celular
      t.string :correo_electronico
      t.string :nacionalidad
      t.integer :anos_estudio
      t.string :profesion
      t.string :ocupacion

      t.timestamps
    end
  end
end
