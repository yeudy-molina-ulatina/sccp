class MotivosConsultaController < ApplicationController
  # GET /motivos_consulta
  # GET /motivos_consulta.json
  def index
    @motivos_consulta = MotivoConsulta.all

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @motivo_consulta }
    end
  end

  # GET /motivos_consulta/1/edit
  def edit
    @motivo_consulta = MotivoConsulta.find(params[:id])
  end

  # POST /motivos_consulta
  # POST /motivos_consulta.json
  def create
    @motivo_consulta = MotivoConsulta.new(params[:motivo_consulta])

    respond_to do |format|
      if @motivo_consulta.save
        format.html { redirect_to @motivo_consulta, notice: 'Motivo consulta was successfully created.' }
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
        format.html { redirect_to @motivo_consulta, notice: 'Motivo consulta was successfully updated.' }
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
