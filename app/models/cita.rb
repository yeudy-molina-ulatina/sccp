class Cita < ActiveRecord::Base
  belongs_to :motivo_consulta
  has_many :reportes
end
