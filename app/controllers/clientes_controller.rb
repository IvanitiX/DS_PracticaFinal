require 'digest'

class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[ show edit update destroy ]

  # GET /clientes or /clientes.json
  def index
    @clientes = Cliente.all
  end

  # GET /clientes/1 or /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes or /clientes.json
  def create
    create_params = cliente_params
    hash = Digest::SHA2.new
    clave = create_params[:contrasena]
    clave = hash.hexdigest(clave)
    create_params[:contrasena] = clave
    @cliente = Cliente.new(create_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: "El Cliente se ha creado correctamente" }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    rescue Exception => e
      if e.is_a? ActiveRecord::RecordNotUnique
        Rails.logger.warn(e)
        format.html { render :new, status: :unprocessable_entity, notice: "El Correo ya está en uso"  }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: "El Cliente se ha actualizado correctamente" }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: "El Cliente se ha borrado correctamente" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(:nombre, :apellidos, :domicilio, :correo, :contrasena)
    end
end
