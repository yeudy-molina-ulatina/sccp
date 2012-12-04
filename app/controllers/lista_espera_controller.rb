class ListaEsperaController < ApplicationController
  
  
    def index
  
      
      if params[:char].nil? and params[:busqueda].nil?
      @motivos_consulta = MotivoConsulta.where(:estado => MotivoConsulta::ESTADO_INACTIVO)
      elsif params[:busqueda].nil?
      @motivos_consulta = MotivoConsulta.joins(:expediente => :pacientes).where("estado = ? AND apellido1 LIKE ?", MotivoConsulta::ESTADO_INACTIVO, "#{params[:char]}%")
      else
        @busqueda = "%#{params[:busqueda]}%"
      @motivos_consulta = MotivoConsulta.joins(:expediente => :pacientes).where("estado = ? AND (motivo_inicial LIKE ? OR motivo_real LIKE ? OR nivel_importancia LIKE ? OR apellido1 LIKE ? OR apellido2 LIKE ? OR nombre LIKE ?)", MotivoConsulta::ESTADO_INACTIVO, @busqueda, @busqueda, @busqueda, @busqueda, @busqueda, @busqueda)
      end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @motivos_consulta }
    end
  
  
  end
end
