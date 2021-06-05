require "test_helper"

class TrabajosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trabajo = trabajos(:one)
  end
  
  test "Al crear trabajo se creará una propuesta" do
    assert_difference('Trabajo.count') do
      post clientes_url, params: {cliente: {nombre: "Adrian", apellidos: "Lastra", domicilio: "Calle A, 420", correo: "adri@correo.es", contrasena: "1234"}}
      post trabajos_url, params: { trabajo: { descripcion: @trabajo.descripcion, localizacion: @trabajo.localizacion, presupuesto: @trabajo.presupuesto} }
    end

    assert_difference('Propuestas.count') do
      post clientes_url, params: {cliente: {nombre: "Adrian", apellidos: "Lastra", domicilio: "Calle A, 420", correo: "adri@correo.es", contrasena: "1234"}}
      post trabajos_url, params: { trabajo: { descripcion: @trabajo.descripcion, localizacion: @trabajo.localizacion, presupuesto: @trabajo.presupuesto} }
    end

    assert_redirected_to trabajo_url(Trabajo.last)
  end

  test "No puede verse un trabajo que no existe" do
    get "/api/v1/trabajos/0"
    assert "nothing"
  end

  



end
