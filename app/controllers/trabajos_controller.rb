class TrabajosController < ApplicationController
  before_action :set_trabajo, only: %i[ show edit update destroy ]
	# @@valoracion = 5
	# @@num_trabajos = 10
  # GET /trabajos or /trabajos.json
  def index
    if session[:user_id] == nil
      redirect_back_or root_path
    end
    @trabajos = Trabajo.where(Id_cliente: session[:user_id])
    #puts @trabajos[:descripcion]
  end

  # GET /trabajos/1 or /trabajos/1.json
  def show
    if session[:user_id] == nil
      redirect_back_or root_path
    end

	 comprobarAsignacionTecnico()
  end
  # GET /trabajos/new
  def new
    if session[:user_id] == nil
      redirect_back_or root_path
    end
    @trabajo = Trabajo.new
  end

  # GET /trabajos/1/edit
  def edit
    if session[:user_id] == nil
      redirect_back_or root_path
    end
  end

  # POST /trabajos or /trabajos.json
  def create
    if session[:user_id] == nil
      redirect_back_or root_path
    end

    create_params = trabajo_params
    create_params[:Id_cliente] = session[:user_id]
    @trabajo = Trabajo.new(create_params)

    respond_to do |format|
      if @trabajo.save
        format.html { redirect_to @trabajo, notice: "Trabajo correctamente añadido." }
        format.json { render :show, status: :created, location: @trabajo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trabajo.errors, status: :unprocessable_entity }
      end
    end

      print create_params
	 proponer_trabajo(create_params[:presupuesto])

  end

  # PATCH/PUT /trabajos/1 or /trabajos/1.json
  def update
    if session[:user_id] == nil
      redirect_back_or root_path
    end
    respond_to do |format|
      if @trabajo.update(trabajo_params)
        format.html { redirect_to @trabajo, notice: "Trabajo correctamente actualizado." }
        format.json { render :show, status: :ok, location: @trabajo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  def valorar

  end

  def valorar_bd
    print params
    tecnico = Tecnico.find_by(id: params[:id])
    if (tecnico != nil)
      valor = params[:valoracion].to_i
      if (valor > 10)
        valor = 10
      elsif (valor < 0)
        valor = 0
      end

      if tecnico[:num_trabajos] > 1 
        valoracion = (tecnico[:valoracion] * (tecnico[:num_trabajos] - 1))/tecnico[:num_trabajos] + valor/tecnico[:num_trabajos]
      end

      consulta = "UPDATE tecnicos SET valoracion = #{valoracion} WHERE id = #{tecnico[:id]}"
      records_array = ActiveRecord::Base.connection.execute(consulta)

      print params[:trabajo]
      consulta = "UPDATE propuestas SET estado = 'TERMINADO' WHERE trabajo = #{params[:trabajo]} and tecnico= #{tecnico[:id]}"
      records_array = ActiveRecord::Base.connection.execute(consulta)
      redirect_back_or trabajos_path
    else
      redirect_back_or trabajos_path
    end
  end


  # DELETE /trabajos/1 or /trabajos/1.json
  def destroy
    if session[:user_id] == nil
      redirect_back_or root_path
    end
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
      params.require(:trabajo).permit(:descripcion, :localizacion, :presupuesto, :tipotrabajo, :Id_tecnico, :Id_cliente, :valoracion, :trabajoid)
    end

	 def proponer_trabajo(presupuesto)
    print "Proponiendo trabajo"

		  valoracion = 5
		 num_trabajos = 10
		 #
 records_array = []
 while records_array.size == 0 and valoracion > 0

			 seleccion = " SELECT * FROM tecnicos "
			  condiciones = " WHERE valoracion > #{valoracion} AND num_trabajos < #{num_trabajos} ";
			# condiciones = " WHERE valoracion > 5 AND num_trabajos < 10";
			 preferencia = " ORDER BY valoracion DESC, num_trabajos ASC "

			 consulta = seleccion + condiciones + preferencia;

			 records_array = ActiveRecord::Base.connection.execute(consulta)

			 records_array.each do |record|
			   consulta =
			 	  "INSERT INTO propuestas(trabajo, tecnico, presupuesto)
			 	  VALUES(#{@trabajo.id}, #{record[0]}, #{presupuesto})"

			   ActiveRecord::Base.connection.execute(consulta)

			 end

  valoracion = valoracion - 1
  num_trabajos = num_trabajos +1
 end
	 end

	 def comprobarAsignacionTecnico

		 # preparamos consulta para obtener propuestas de este trabajo que
		  # hayan sido aceptadas por los tecnicos y dispongan de un presupuesto
		 seleccion = "SELECT tecnico, presupuesto,id FROM propuestas"
		 condiciones = " WHERE trabajo = #{@trabajo.id} AND (estado ='CONFIRMADO' OR estado = 'CONFIRMADA')";
		 preferencia = " ORDER BY presupuesto ASC";

		 consulta = seleccion + condiciones + preferencia;
		 records_array = ActiveRecord::Base.connection.execute(consulta)

		 primero = []
		 records_array.each do |record|
			 primero = record
			 break
		 end

		 if (primero.length > 0)
      print primero
			 # actualizar este trabajo
			 @trabajo.Id_tecnico = primero[0]
			 @trabajo.presupuesto = primero[1]

			 @trabajo.save

      consulta = "UPDATE propuestas SET estado = 'ASIGNADO' WHERE id = #{primero[2]}"
      records_array = ActiveRecord::Base.connection.execute(consulta)

			 # params[:Id_tecnico] = @trabajo.Id_tecnico
			 # params[:presupuesto] = @trabajo.presupuesto
			 #
		 	#@trabajo.update(params)
		 else
			 print("No hay propuestas confirmadas todavia lo siento")
		 end
	 end
end
