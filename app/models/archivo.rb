class Archivo < ActiveRecord::Base
  belongs_to :motivo_consulta
  def self.save (uploaded_io)
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
    end
  end

end
