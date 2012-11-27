class MotivoConsulta < ActiveRecord::Base
  belongs_to :expediente
  
  ESTADO_ACTIVO = :activo
  ESTADO_INACTIVO = :inactivo
  ESTADO_SUSPENDIDO = :suspendido
  ESTADO_ABANDONADO = :abandonado
  ESTADO_CERRADO = :cerrado
  
end
