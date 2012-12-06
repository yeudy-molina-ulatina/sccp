class Expediente < ActiveRecord::Base
  has_and_belongs_to_many :pacientes
  has_many :motivos_consulta, :class_name => "MotivoConsulta"
  
  has_many :supervisores, :through => :motivos_consulta, :conditions => "estado = \"#{MotivoConsulta::ESTADO_ACTIVO}\""
  has_many :tratantes, :through => :motivos_consulta, :conditions => "estado = \"#{MotivoConsulta::ESTADO_ACTIVO}\"" 
  
  EXPEDIENTE_INDIVIDUAL = :individual
  EXPEDIENTE_GRUPAL = :grupal
  
  def individual?
    tipo_expediente.to_s == EXPEDIENTE_INDIVIDUAL.to_s
  end
  
  def create_grupal
    
    
    
  end
  
  
  
end
