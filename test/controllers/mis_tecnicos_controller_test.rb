require "test_helper"

class MisTecnicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mis_tecnico = mis_tecnicos(:one)
  end

  test "should get index" do
    get mis_tecnicos_url
    assert_response :success
  end

  test "should get new" do
    get new_mis_tecnico_url
    assert_response :success
  end

  test "should create mis_tecnico" do
    assert_difference('MisTecnico.count') do
      post mis_tecnicos_url, params: { mis_tecnico: { apellidos: @mis_tecnico.apellidos, contrasenia: @mis_tecnico.contrasenia, email: @mis_tecnico.email, nombre: @mis_tecnico.nombre, numero_trabajos: @mis_tecnico.numero_trabajos, tipo_tecnico_id: @mis_tecnico.tipo_tecnico_id, valoracion: @mis_tecnico.valoracion } }
    end

    assert_redirected_to mis_tecnico_url(MisTecnico.last)
  end

  test "should show mis_tecnico" do
    get mis_tecnico_url(@mis_tecnico)
    assert_response :success
  end

  test "should get edit" do
    get edit_mis_tecnico_url(@mis_tecnico)
    assert_response :success
  end

  test "should update mis_tecnico" do
    patch mis_tecnico_url(@mis_tecnico), params: { mis_tecnico: { apellidos: @mis_tecnico.apellidos, contrasenia: @mis_tecnico.contrasenia, email: @mis_tecnico.email, nombre: @mis_tecnico.nombre, numero_trabajos: @mis_tecnico.numero_trabajos, tipo_tecnico_id: @mis_tecnico.tipo_tecnico_id, valoracion: @mis_tecnico.valoracion } }
    assert_redirected_to mis_tecnico_url(@mis_tecnico)
  end

  test "should destroy mis_tecnico" do
    assert_difference('MisTecnico.count', -1) do
      delete mis_tecnico_url(@mis_tecnico)
    end

    assert_redirected_to mis_tecnicos_url
  end
end
