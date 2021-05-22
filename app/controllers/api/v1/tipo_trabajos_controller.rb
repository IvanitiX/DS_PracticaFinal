module Api
    module V1
        class TipoTrabajosController < ApplicationController
            skip_before_action :verify_authenticity_token

            def show
                @tipo_trabajo = TipoTrabajo.find_by(id: params[:id])
                if (@tipo_trabajo!=nil)
                    render json: @tipo_trabajo, status: :ok
            else
                render json: :nothing, status: :not_found
                end
            end

            def index
                    render json: TipoTrabajo.all, status: :ok
            end
        end
    end
end