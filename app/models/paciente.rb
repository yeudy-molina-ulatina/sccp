class Paciente < ActiveRecord::Base
  has_and_belongs_to_many :expedientes
  validates_presence_of :nombre, :apellido1, :apellido2, :fecha_nacimiento, :genero, :provincia, :canton, :distrito, :otras_senas, :telefono_celular
  end
