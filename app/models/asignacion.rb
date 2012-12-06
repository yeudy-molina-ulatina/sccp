class Asignacion < ActiveRecord::Base
  
  TIPO_ASIGNACION_SUPERVISOR = 'supervisor'
  TIPO_ASIGNACION_TRATANTE = 'tratante'
  TIPOS_ASIGNACION = [TIPO_ASIGNACION_SUPERVISOR, TIPO_ASIGNACION_TRATANTE]    
  
  belongs_to :usuario
  belongs_to :motivo_consulta

  after_initialize :init
  
  def init
    self.tipo_asignacion  ||= TIPO_ASIGNACION_TRATANTE
  end

end
