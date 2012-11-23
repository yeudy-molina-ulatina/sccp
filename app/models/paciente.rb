class Paciente < ActiveRecord::Base
  has_and_belongs_to_many :expedientes
end
