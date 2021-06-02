module Api
    module V1
        class TecnicosController < ApplicationController

skip_before_action :verify_authenticity_token

def show
		@tecnico = Tecnico.where("email like '%#{params[:id]}%'")
#		@tecnico = Tecnico.find_by(id: params[:id])

      if (@tecnico!=nil)
        render json: @tecnico[0], status: :ok
  else
       render json: :nothing, status: :not_found
    end
end

def index
        render json: Tecnico.all, status: :ok
end

def update
 @tecnico = Tecnico.find(params[:id])

  if @tecnico.update(tecnico_params)
        render json: @tecnico, status: :ok
      else
        render json: @tecnico.errors, status: :unprocessable_entity
      end
end

def create
    @tecnico = Tecnico.new(tecnico_params)

      if @tecnico.save
        render json: @tecnico, status: :created
      else
        render json: @tecnico.errors, status: :unprocessable_entity
      end
end

def destroy
    @tecnico = Tecnico.find(params[:id])
    if @tecnico.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
end
private
def tecnico_params
      params.permit(:nombre, :apellidos, :email, :contrasena, :tipo_tecnico, :num_trabajos)
end
        end
    end
end
