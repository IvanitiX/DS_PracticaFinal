require "test_helper"

class PropuestasControllerTest < ActionDispatch::IntegrationTest
  test "Si está asignado, el trabajo deberá tener un ID_Tecnico" do
    post clientes_url, params: {cliente: {nombre: "Adrian", apellidos: "Lastra", domicilio: "Calle A, 420", correo: "adri@correo.es", contrasena: "1234"}}
    post trabajos_url, params: { trabajo: { descripcion: "Enlucir pared", localizacion: "ª", presupuesto: 234.56} }
    propuesta = Propuestas.find_by(tecnico: 980190962);
    assert_not propuesta == nil;

    id = propuesta[:id] 
    trabajo = propuesta[:trabajo]
    put "/api/v1/propuestas/#{id}", params: {estado: "CONFIRMADO"}

    get "/trabajos/#{trabajo}"
    asignados = Propuestas.find_by(estado: "ASIGNADO")
    assert_not asignados == nil
    assert_not Trabajo.find_by(id: trabajo)[:Id_tecnico] == nil

  end
end
