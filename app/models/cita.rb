class Cita < ActiveRecord::Base
  belongs_to :motivo_consulta
  has_many :reportes
  has_and_belongs_to_many :pacientes 
  has_and_belongs_to_many :usuarios
end
