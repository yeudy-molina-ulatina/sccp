class AsignacionesController < ApplicationController
  # GET /motivos_consulta/1/asignaciones
  # GET /motivos_consulta/1/asignaciones.json
  
  def index
    @motivo_consulta = MotivoConsulta.find(params[:motivo_consulta_id])
    @asignaciones = @motivo_consulta.asignaciones

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asignaciones }
    end
  end

  # GET /motivos_consulta/1/asignaciones/1
  # GET /motivos_consulta/1/asignaciones/1.json
  def show
    @motivo_consulta = MotivoConsulta.find(params[:motivo_consulta_id])
    @asignacion = @motivo_consulta.asignaciones.find(params[:id])    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asignacion }
    end
  end

  # GET /motivos_consulta/1/asignaciones/new
  # GET /motivos_consulta/1/asignaciones/new.json
  def new
    @tipo_asignacion = params[:tipo_asignacion]
    
    if @tipo_asignacion.nil? or not Asignacion::TIPOS_ASIGNACION.include? @tipo_asignacion
      @tipo_asignacion = Asignacion::TIPO_ASIGNACION_TRATANTE
    end
    
    if @tipo_asignacion == Asignacion::TIPO_ASIGNACION_TRATANTE
      @usuarios = Usuario.usuarios_tratantes
    else
      @usuarios = Usuario.usuarios_supervisores
    end
    
    @motivo_consulta = MotivoConsulta.find(params[:motivo_consulta_id])
    @asignacion = @motivo_consulta.asignaciones.build
    @asignacion.tipo_asignacion = @tipo_asignacion

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @asignacion }
    end
  end

  # GET /motivos_consulta/1/asignaciones/1/edit
  def edit
    @motivo_consulta = MotivoConsulta.find(params[:motivo_consulta_id])
    @asignacion = @motivo_consulta.asignaciones.find(params[:id])
    
    if @asignacion.tipo_asignacion == Asignacion::TIPO_ASIGNACION_TRATANTE
      @usuarios = Usuario.usuarios_tratantes
    else
      @usuarios = Usuario.usuarios_supervisores
    end    
  end

  # POST /motivos_consulta/1/asignaciones
  # POST /motivos_consulta/1/asignaciones.json
  def create
    @motivo_consulta = MotivoConsulta.find(params[:motivo_consulta_id])
    @asignacion = @motivo_consulta.asignaciones.create(params[:asignacion])

    respond_to do |format|
      if @asignacion.save and @motivo_consulta.update_attribute(:estado, MotivoConsulta::ESTADO_ACTIVO)
        format.html { redirect_to @motivo_consulta, notice: 'Asignacion was successfully created.' }
        format.json { render json: @motivo_consulta, status: :created, location: @asignacion }
      else
        format.html { render action: "new" }
        format.json { render json: @asignacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /motivos_consulta/1/asignaciones/1
  # PUT /motivos_consulta/1/asignaciones/1.json
  def update
    @motivo_consulta = MotivoConsulta.find(params[:motivo_consulta_id])
    @asignacion = @motivo_consulta.asignaciones.find(params[:id])
    
    respond_to do |format|
      if @asignacion.update_attributes(params[:asignacion])
        format.html { redirect_to @motivo_consulta, notice: 'Asignacion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @asignacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motivos_consulta/1/asignaciones/1
  # DELETE /motivos_consulta/1/asignaciones/1.json
  def destroy
    @motivo_consulta = MotivoConsulta.find(params[:motivo_consulta_id])
    @asignacion = @motivo_consulta.asignaciones.find(params[:id])    
    @asignacion.destroy

    respond_to do |format|
      format.html { redirect_to @motivo_consulta }
      format.json { head :no_content }
    end
  end
end
