class TecnicosController < ApplicationController
  before_action :set_tecnico, only: %i[ show edit update destroy ]

  # GET /tecnicos or /tecnicos.json
  def index
    @tecnicos = Tecnico.all
  end

  # GET /tecnicos/1 or /tecnicos/1.json
  def show
  end

  # GET /tecnicos/new
  def new
    @tecnico = Tecnico.new
  end

  # GET /tecnicos/1/edit
  def edit
  end

  # POST /tecnicos or /tecnicos.json
  def create
    @tecnico = Tecnico.new(tecnico_params)

    respond_to do |format|
      if @tecnico.save
        format.html { redirect_to @tecnico, notice: "Tecnico was successfully created." }
        format.json { render :show, status: :created, location: @tecnico }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tecnico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tecnicos/1 or /tecnicos/1.json
  def update
    respond_to do |format|
      if @tecnico.update(tecnico_params)
        format.html { redirect_to @tecnico, notice: "Tecnico was successfully updated." }
        format.json { render :show, status: :ok, location: @tecnico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tecnico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tecnicos/1 or /tecnicos/1.json
  def destroy
    @tecnico.destroy
    respond_to do |format|
      format.html { redirect_to tecnicos_url, notice: "Tecnico was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tecnico
      @tecnico = Tecnico.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tecnico_params
      params.require(:tecnico).permit(:nombre, :apellidos, :domicilio, :email, :contrasena, :tipo_tecnico)
    end
end
