class ReportesController < ApplicationController
  # GET /reportes
  # GET /reportes.json
  def index
    @reportes = Reporte.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reportes }
    end
  end

  # GET /citas/1/reportes/1
  # GET /citas/1//reportes/1.json
  def show
    @cita = Cita.find(params[:cita_id])
    @reporte = @cita.reportes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reporte }
    end
  end

  # GET citas/1/reportes/new
  # GET citas/1/reportes/new.json
  def new
    @cita = Cita.find(params[:cita_id])
    @reporte = @cita.reportes.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reporte }
    end
  end

  # GET /reportes/1/edit
  def edit
    @cita = Cita.find(params[:cita_id])
    @reporte = @cita.reportes.find(params[:id])
  end

  # POST citas/1/reportes
  # POST citas/1/reportes.json
  def create
    @cita = Cita.find(params[:cita_id])
    @reporte = @cita.reportes.create(params[:reporte])    

    respond_to do |format|
      if @reporte.save
        format.html { redirect_to [@cita, @reporte], notice: 'Reporte fue creado exitosamente.' }
        format.json { render json: @reporte, status: :created, location: @reporte }
      else
        format.html { render action: "new" }
        format.json { render json: @reporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reportes/1
  # PUT /reportes/1.json
  def update
    @reporte = Reporte.find(params[:id])

    respond_to do |format|
      if @reporte.update_attributes(params[:reporte])
        format.html { redirect_to @reporte, notice: 'Reporte fue actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reportes/1
  # DELETE /reportes/1.json
  def destroy
    @reporte = Reporte.find(params[:id])
    @reporte.destroy

    respond_to do |format|
      format.html { redirect_to reportes_url }
      format.json { head :no_content }
    end
  end
end
