class Rol < ActiveRecord::Base
  
  def self.roles_tratantes
    %w{Director, Psicologo, Profesor, Estudiante} 
  end
  
  def self.roles_supervisores
    %w{Director, Psicologo, Profesor} 
  end  
     
end
