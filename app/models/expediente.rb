class Expediente < ActiveRecord::Base
  has_and_belongs_to_many :pacientes
  has_many :motivos_consulta
  
  EXPEDIENTE_INDIVIDUAL = :individual
  EXPEDIENTE_GRUPAL = :grupal
  
  
  
end
