class CitasController < ApplicationController
  # GET /citas
  # GET /citas.json
  def index
    @citas = Cita.all
    
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @citas }
    end
  end

  # GET /citas/1
  # GET /citas/1.json
  def show
    @cita = Cita.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cita }
    end
  end

  # GET /citas/new
  # GET /citas/new.json
  def new
    @cita = Cita.new
    @pacientes = Paciente.joins(:expedientes => :motivos_consulta).where("estado = ?", MotivoConsulta::ESTADO_ACTIVO).order(:apellido1,:apellido2,:nombre)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cita }
    end
  end

  # GET /citas/1/edit
  def edit
    @cita = Cita.find(params[:id])
    @pacientes = Paciente.joins(:expedientes => :motivos_consulta).where("estado = ?", MotivoConsulta::ESTADO_ACTIVO).order(:apellido1,:apellido2,:nombre)
  end

  # POST /citas
  # POST /citas.json
  def create
    @cita = Cita.new(params[:cita])
    @motivo_consulta = MotivoConsulta.find(@cita.motivo_consulta_id)
    @cita.pacientes = @motivo_consulta.pacientes
    @cita.usuarios = @motivo_consulta.tratantes + @motivo_consulta.supervisores
    respond_to do |format|
      if @cita.save
        format.html { redirect_to @cita, notice: 'Cita creada satisfactoriamente.' }
        format.json { render json: @cita, status: :created, location: @cita }
      else
        format.html { render action: "new" }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /citas/1
  # PUT /citas/1.json
  def update
    @cita = Cita.find(params[:id])

    respond_to do |format|
      if @cita.update_attributes(params[:cita])
        format.html { redirect_to @cita, notice: 'Cita creada satisfactoriamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citas/1
  # DELETE /citas/1.json
  def destroy
    @cita = Cita.find(params[:id])
    @cita.destroy

    respond_to do |format|
      format.html { redirect_to citas_url }
      format.json { head :no_content }
    end
  end
end
