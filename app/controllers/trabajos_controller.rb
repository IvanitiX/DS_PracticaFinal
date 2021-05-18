class TrabajosController < ApplicationController
  before_action :set_trabajo, only: %i[ show edit update destroy ]

  # GET /trabajos or /trabajos.json
  def index
    @trabajos = Trabajo.all
  end

  # GET /trabajos/1 or /trabajos/1.json
  def show
  end

  # GET /trabajos/new
  def new
    @trabajo = Trabajo.new
  end

  # GET /trabajos/1/edit
  def edit
  end

  # POST /trabajos or /trabajos.json
  def create
    @trabajo = Trabajo.new(trabajo_params)

    respond_to do |format|
      if @trabajo.save
        format.html { redirect_to @trabajo, notice: "Trabajo was successfully created." }
        format.json { render :show, status: :created, location: @trabajo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trabajos/1 or /trabajos/1.json
  def update
    respond_to do |format|
      if @trabajo.update(trabajo_params)
        format.html { redirect_to @trabajo, notice: "Trabajo was successfully updated." }
        format.json { render :show, status: :ok, location: @trabajo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trabajos/1 or /trabajos/1.json
  def destroy
    @trabajo.destroy
    respond_to do |format|
      format.html { redirect_to trabajos_url, notice: "Trabajo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trabajo
      @trabajo = Trabajo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trabajo_params
      params.require(:trabajo).permit(:descripcion, :localizacion, :presupuesto)
    end
end
