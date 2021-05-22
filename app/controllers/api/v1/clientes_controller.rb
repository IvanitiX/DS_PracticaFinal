module Api
    module V1
        class ClientesController < ApplicationController
            
skip_before_action :verify_authenticity_token

def show
      @cliente = Cliente.find_by(id: params[:id])
      if (@cliente!=nil)
        render json: @cliente, status: :ok
  else
       render json: :nothing, status: :not_found
    end
end

def index
        render json: Cliente.all, status: :ok
end
        end
    end
end