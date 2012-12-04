class MotivosConsultaController < ApplicationController
  # GET /motivos_consulta
  # GET /motivos_consulta.json
  def index
    
    @motivos_consulta = MotivoConsulta.all
    
    if params[:char].nil? and params[:busqueda].nil?
      @motivos_consulta = MotivoConsulta.all
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

  # GET /motivos_consulta/1
  # GET /motivos_consulta/1.json
  def show
    @motivo_consulta = MotivoConsulta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @motivo_consulta }
    end
  end

  # GET /motivos_consulta/new
  # GET /motivos_consulta/new.json
  def new
    @motivo_consulta = MotivoConsulta.new
    @pacientes = Paciente.all(:order => [:apellido1,:apellido2,:nombre])
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @motivo_consulta }
    end
  end

  # GET /motivos_consulta/1/edit
  def edit
    @motivo_consulta = MotivoConsulta.find(params[:id])
    @pacientes = Paciente.all(:order => [:apellido1,:apellido2,:nombre])
  end

  # POST /motivos_consulta
  # POST /motivos_consulta.json
  def create
        
   @motivo_consulta = MotivoConsulta.new(params[:motivo_consulta].merge({:estado => MotivoConsulta::ESTADO_INACTIVO}))   
    respond_to do |format|
      if @motivo_consulta.save
        format.html { redirect_to @motivo_consulta, notice: 'Motivo de consulta fue creado exitosamente.' }
        format.json { render json: @motivo_consulta, status: :created, location: @motivo_consulta }
      else
        format.html { render action: "new" }
        format.json { render json: @motivo_consulta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /motivos_consulta/1
  # PUT /motivos_consulta/1.json
  def update
    @motivo_consulta = MotivoConsulta.find(params[:id])

    respond_to do |format|
      if @motivo_consulta.update_attributes(params[:motivo_consulta])
        format.html { redirect_to @motivo_consulta, notice: 'Motivo de consulta fue actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @motivo_consulta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motivos_consulta/1
  # DELETE /motivos_consulta/1.json
  def destroy
    @motivo_consulta = MotivoConsulta.find(params[:id])
    @motivo_consulta.destroy

    respond_to do |format|
      format.html { redirect_to motivos_consulta_url }
      format.json { head :no_content }
    end
  end
end
