require "test_helper"

class ClientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cliente = clientes(:one)
  end

  test "No puede verse un cliente que no existe" do
    get "/api/v1/clientes/0"
    assert "nothing"
  end

  test "Crea un cliente, y me miras los datos desde web y desde API" do
    assert_difference('Cliente.count') do
       post clientes_url, params: {cliente: {nombre: "Adrian", apellidos: "Lastra", domicilio: "Calle A, 420", correo: "adri@correo.es", contrasena: "1234"}}
    end

    cliente = Cliente.find_by(correo: "adri@correo.es")

    id= cliente[:id]

    assert cliente[:nombre] == "Adrian"

    cliente = get "/api/v1/clientes/#{id}"
    assert cliente == 200

  end

  test "No puedes acceder donde no estés registrado" do
    get "/trabajos"
    assert_redirected_to root_path

    post clientes_url, params: {cliente: {nombre: "Adrian", apellidos: "Lastra", domicilio: "Calle A, 420", correo: "adri@correo.es", contrasena: "1234"}}
    get "/trabajos"
    assert_response :success
  end

  test "Si borramos un cliente, ¿sus referencias se borrarían?" do
    assert_difference('Cliente.count') do
      post clientes_url, params: {cliente: {nombre: "Adrian", apellidos: "Lastra", domicilio: "Calle A, 420", correo: "adri@correo.es", contrasena: "1234"}}
    end

    cliente = Cliente.find_by(correo:"adri@correo.es")

    assert_difference('Trabajo.count') do
      post trabajos_url, params: { trabajo: { descripcion: "Enlucir pared", localizacion: "ª", presupuesto: 234.56} }
   end

  
   antes_trabajos = Trabajo.count
   antes_clientes = Cliente.count
   assert_raises(ActiveRecord::InvalidForeignKey) do
    delete "/clientes/#{cliente[:id]}"
   end
    rescue 
      despues_trabajos = Trabajo.count
      despues_clientes = Cliente.count

      assert_equal antes_clientes - 1, despues_clientes
      assert_equal antes_trabajos - 1, despues_trabajos
   

  end

end
