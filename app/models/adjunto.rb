class Adjunto < ActiveRecord::Base
  
  belongs_to :motivo_consulta
  
  attr_accessible :archivo
  has_attached_file :archivo
  
end
