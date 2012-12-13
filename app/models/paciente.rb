class Paciente < ActiveRecord::Base
  has_and_belongs_to_many :expedientes
  has_and_belongs_to_many :citas   
  has_many :motivos_consulta, :through => :expedientes

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
  
  def motivo_consulta_activo
    motivos_consulta.where(:estado => MotivoConsulta::ESTADO_ACTIVO).first
  end   
  
   def motivo_consulta_activo_id
    motivo_consulta_activo.id
  end
  
    def edad
      edad = Date.today.year - read_attribute(:fecha_nacimiento).year
      if Date.today.month < read_attribute(:fecha_nacimiento).month || (Date.today.month == read_attribute(:fecha_nacimiento).month &&
        read_attribute(:fecha_nacimiento).day >= Date.today.day)
      edad = edad - 1
    end
    return edad
  end
          
end
