class MotivoConsulta < ActiveRecord::Base
  belongs_to :expediente
  has_many :citas
  has_many :pacientes, :through => :expediente
  has_many :asignaciones
  has_many :asignaciones_tratantes, :class_name => "Asignacion", :conditions => "tipo_asignacion = \"#{Asignacion::TIPO_ASIGNACION_TRATANTE}\""
  has_many :asignaciones_supervisores, :class_name => "Asignacion", :conditions => "tipo_asignacion = \"#{Asignacion::TIPO_ASIGNACION_SUPERVISOR}\"" 
  has_many :supervisores, :through => :asignaciones, :source => "usuario", :conditions => "tipo_asignacion = \"#{Asignacion::TIPO_ASIGNACION_SUPERVISOR}\""
  has_many :tratantes, :through => :asignaciones, :source => "usuario", :conditions => "tipo_asignacion = \"#{Asignacion::TIPO_ASIGNACION_TRATANTE}\""
   
    
  ESTADO_ACTIVO = :activo
  ESTADO_INACTIVO = :inactivo
  ESTADO_SUSPENDIDO = :suspendido
  ESTADO_ABANDONADO = :abandonado
  ESTADO_CERRADO = :cerrado
  
  
end
