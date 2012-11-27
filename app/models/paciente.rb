class Paciente < ActiveRecord::Base
  has_and_belongs_to_many :expedientes
  validates_presence_of :nombre, :apellido1, :apellido2, :fecha_nacimiento, :genero, :provincia, :canton, :distrito, :otras_senas, :telefono_celular
  

  def nombre_completo
    "#{apellido1} #{apellido2} #{nombre}"
  end
  
  def expediente_individual
    expedientes.where(:tipo_expediente => Expediente::EXPEDIENTE_INDIVIDUAL).first
  end
  
  def expediente_individual_id
    expediente_individual.id
  end  
end
