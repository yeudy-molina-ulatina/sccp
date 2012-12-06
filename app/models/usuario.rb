class Usuario < ActiveRecord::Base
  belongs_to :rol
  has_many :asignaciones
  has_many :motivos_consulta, :through => :asignaciones
  
  attr_accessible :usuario, :password, :password_confirmation, :nombre, :apellido1, :apellido2, :correo_electronico, :rol_id
  validates :usuario, presence: true, uniqueness: true
  validates :password, :presence => true,
                    :length => { :minimum => 5, :maximum => 40 },
                    :confirmation =>true  
  validates :correo_electronico, presence: true, uniqueness: true                    
                    

  has_secure_password  
  
  def nombre_completo
    "#{apellido1} #{apellido2} #{nombre}"
  end  
  
  def self.usuarios_tratantes
    @usuarios = Usuario.joins(:rol).where('rols.nombre' => Rol.roles_tratantes).order(:apellido1, :apellido2, :nombre)
  end
  
  def self.usuarios_supervisores
    @usuarios = Usuario.joins(:rol).where('rols.nombre' => Rol.roles_supervisores).order(:apellido1, :apellido2, :nombre)
  end
  
      
end
