module Api
    module V1
        class PropuestasController < ApplicationController
            skip_before_action :verify_authenticity_token

            def show
                @propuesta = Propuestas.find_by(id: params[:id])
                if (@propuesta!=nil)
                    render json: @propuesta, status: :ok
            else
                render json: :nothing, status: :not_found
                end
            end

            def index
                    render json: Propuestas.all, status: :ok
            end

            def list
                print params
                @propuesta = Propuestas.where(tecnico: params[:id])
                if (@propuesta!=nil)
                    render json: @propuesta, status: :ok
                else
                     render json: :nothing, status: :not_found
                end
            end

				# GET /tecnicos/new
			   def new
			     @tecnico = Tecnico.new
			   end
        end
    end
 end
