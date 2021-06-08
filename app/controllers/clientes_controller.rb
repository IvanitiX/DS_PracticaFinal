require 'digest'

class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[ show edit update destroy ]

  # GET /clientes/1 or /clientes/1.json
  def show
    if session[:user_id] == nil
      redirect_back_or root_path
    end
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  def profile
    if session[:user_id] == nil
      redirect_back_or root_path
    else
      @cliente = Cliente.find_by(id: session[:user_id])
    end
  end

  # GET /clientes/1/edit
  def edit
    if session[:user_id] == nil
      redirect_back_or root_path
    end
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
        session[:user_id] = @cliente.id
        format.html { redirect_to profile, notice: "El Cliente se ha creado correctamente" }
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
    if session[:user_id] == nil
      redirect_back_or root_path
    end

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
    if session[:user_id] == nil
      redirect_back_or root_path
    end

	 # Eliminar la sesion para destruir correctamente
	 session[:user_id] = nil

    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: "El Cliente se ha borrado correctamente" }
      format.json { head :no_content }
    end

	 # Eliminar la sesion si se destruyó
	 session[:user_id] = nil
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
