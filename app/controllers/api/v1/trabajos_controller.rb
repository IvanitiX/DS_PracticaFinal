module Api
    module V1
        class TrabajosController < ApplicationController
            
skip_before_action :verify_authenticity_token

def show
      @trabajo = Trabajo.find_by(id: params[:id])
      if (@trabajo!=nil)
        render json: @trabajo, status: :ok
  else
       render json: :nothing, status: :not_found
    end
end

def index
        render json: Trabajo.all, status: :ok
end

def update
 @trabajo = Trabajo.find(params[:id])

  if @trabajo.update(trabajo_params)
        render json: @trabajo, status: :ok
      else
        render json: @trabajo.errors, status: :unprocessable_entity
      end
end

def create
    @trabajo = Trabajo.new(trabajo_params)

      if @trabajo.save
        render json: @trabajo, status: :created
      else
        render json: @trabajo.errors, status: :unprocessable_entity
      end
end

def destroy
    @trabajo = Trabajo.find(params[:id])
    if @trabajo.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
end
private
def trabajo_params
      params.permit(:descripcion, :localizacion, :presupuesto, :tipotrabajo, :Id_tecnico);
end
        end
    end
end