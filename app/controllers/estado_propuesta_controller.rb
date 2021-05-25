class EstadoPropuestaController < ApplicationController
  before_action :set_estado_propuestum, only: %i[ show edit update destroy ]

  # GET /estado_propuesta or /estado_propuesta.json
  def index
    @estado_propuesta = EstadoPropuestum.all
  end

  # GET /estado_propuesta/1 or /estado_propuesta/1.json
  def show
  end

  # GET /estado_propuesta/new
  def new
    @estado_propuestum = EstadoPropuestum.new
  end

  # GET /estado_propuesta/1/edit
  def edit
  end

  # POST /estado_propuesta or /estado_propuesta.json
  def create
    @estado_propuestum = EstadoPropuestum.new(estado_propuestum_params)

    respond_to do |format|
      if @estado_propuestum.save
        format.html { redirect_to @estado_propuestum, notice: "Estado propuestum was successfully created." }
        format.json { render :show, status: :created, location: @estado_propuestum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estado_propuestum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_propuesta/1 or /estado_propuesta/1.json
  def update
    respond_to do |format|
      if @estado_propuestum.update(estado_propuestum_params)
        format.html { redirect_to @estado_propuestum, notice: "Estado propuestum was successfully updated." }
        format.json { render :show, status: :ok, location: @estado_propuestum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estado_propuestum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_propuesta/1 or /estado_propuesta/1.json
  def destroy
    @estado_propuestum.destroy
    respond_to do |format|
      format.html { redirect_to estado_propuesta_url, notice: "Estado propuestum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_propuestum
      @estado_propuestum = EstadoPropuestum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estado_propuestum_params
      params.require(:estado_propuestum).permit(:estado)
    end
end
