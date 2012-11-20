class MotivoConsultaController < ApplicationController
  # GET /motivo_consulta
  # GET /motivo_consulta.json
  def index
    @motivo_consulta = MotivoConsultum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @motivo_consulta }
    end
  end

  # GET /motivo_consulta/1
  # GET /motivo_consulta/1.json
  def show
    @motivo_consultum = MotivoConsultum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @motivo_consultum }
    end
  end

  # GET /motivo_consulta/new
  # GET /motivo_consulta/new.json
  def new
    @motivo_consultum = MotivoConsultum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @motivo_consultum }
    end
  end

  # GET /motivo_consulta/1/edit
  def edit
    @motivo_consultum = MotivoConsultum.find(params[:id])
  end

  # POST /motivo_consulta
  # POST /motivo_consulta.json
  def create
    @motivo_consultum = MotivoConsultum.new(params[:motivo_consultum])

    respond_to do |format|
      if @motivo_consultum.save
        format.html { redirect_to @motivo_consultum, notice: 'Motivo consultum was successfully created.' }
        format.json { render json: @motivo_consultum, status: :created, location: @motivo_consultum }
      else
        format.html { render action: "new" }
        format.json { render json: @motivo_consultum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /motivo_consulta/1
  # PUT /motivo_consulta/1.json
  def update
    @motivo_consultum = MotivoConsultum.find(params[:id])

    respond_to do |format|
      if @motivo_consultum.update_attributes(params[:motivo_consultum])
        format.html { redirect_to @motivo_consultum, notice: 'Motivo consultum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @motivo_consultum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motivo_consulta/1
  # DELETE /motivo_consulta/1.json
  def destroy
    @motivo_consultum = MotivoConsultum.find(params[:id])
    @motivo_consultum.destroy

    respond_to do |format|
      format.html { redirect_to motivo_consulta_url }
      format.json { head :no_content }
    end
  end
end
