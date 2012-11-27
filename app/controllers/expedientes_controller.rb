class ExpedientesController < ApplicationController
  # GET /expedientes
  # GET /expedientes.json
  def index
    
    if params[:char].nil? and params[:busqueda].nil?
      @expedientes = Expediente.all
    elsif  params[:busqueda].nil?  
      @expedientes = Expediente.joins(:pacientes).where("apellido1 LIKE ?", "#{params[:char]}%")
    else
      @busqueda = "%#{params[:busqueda]}%"
      @expedientes = Expediente.joins(:pacientes).where("tipo_expediente LIKE ? OR tipo_familia LIKE ? OR apellido1 LIKE ? OR apellido2 LIKE ? OR nombre LIKE ?", @busqueda, @busqueda, @busqueda, @busqueda, @busqueda)
      
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expedientes }
    end
  end
  
  def get_paciente
   # voy acá !!!!
  end

  # GET /expedientes/1
  # GET /expedientes/1.json
  def show
    @expediente = Expediente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expediente }
    end
  end

  # GET /expedientes/new
  # GET /expedientes/new.json
  def new
    @expediente = Expediente.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expediente }
    end
  end

  # GET /expedientes/1/edit
  def edit
    @expediente = Expediente.find(params[:id])
  end

  # POST /expedientes
  # POST /expedientes.json
  def create
    @expediente = Expediente.new(params[:expediente])

    respond_to do |format|
      if @expediente.save
        format.html { redirect_to @expediente, notice: 'Expediente was successfully created.' }
        format.json { render json: @expediente, status: :created, location: @expediente }
      else
        format.html { render action: "new" }
        format.json { render json: @expediente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expedientes/1
  # PUT /expedientes/1.json
  def update
    @expediente = Expediente.find(params[:id])

    respond_to do |format|
      if @expediente.update_attributes(params[:expediente])
        format.html { redirect_to @expediente, notice: 'Expediente was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expediente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expedientes/1
  # DELETE /expedientes/1.json
  def destroy
    @expediente = Expediente.find(params[:id])
    @expediente.destroy

    respond_to do |format|
      format.html { redirect_to expedientes_url }
      format.json { head :no_content }
    end
  end
end
