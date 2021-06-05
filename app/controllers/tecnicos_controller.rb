class TecnicosController < ApplicationController
  # PATCH/PUT /tecnicos/1 or /tecnicos/1.json
  def update
    respond_to do |format|
      tecnico = Tecnico.find_by(id: params[:id])
      create_params= tecnico_params
      create_params[:valoracion] = tecnico[:valoracion] + tecnico_params[:valoracion]/10
      if tecnico.update(create_params)
        redirect_back_or trabajos_path
    end
  end
end

    # Only allow a list of trusted parameters through.
    def tecnico_params
      params.require(:tecnico).permit(:valoracion)
    end
end
