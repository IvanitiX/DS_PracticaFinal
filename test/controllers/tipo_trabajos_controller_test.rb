require "test_helper"

class TipoTrabajosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_trabajo = tipo_trabajos(:one)
  end

  test "should get index" do
    get tipo_trabajos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_trabajo_url
    assert_response :success
  end

  test "should create tipo_trabajo" do
    assert_difference('TipoTrabajo.count') do
      post tipo_trabajos_url, params: { tipo_trabajo: { Tipo: @tipo_trabajo.Tipo } }
    end

    assert_redirected_to tipo_trabajo_url(TipoTrabajo.last)
  end

  test "should show tipo_trabajo" do
    get tipo_trabajo_url(@tipo_trabajo)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_trabajo_url(@tipo_trabajo)
    assert_response :success
  end

  test "should update tipo_trabajo" do
    patch tipo_trabajo_url(@tipo_trabajo), params: { tipo_trabajo: { Tipo: @tipo_trabajo.Tipo } }
    assert_redirected_to tipo_trabajo_url(@tipo_trabajo)
  end

  test "should destroy tipo_trabajo" do
    assert_difference('TipoTrabajo.count', -1) do
      delete tipo_trabajo_url(@tipo_trabajo)
    end

    assert_redirected_to tipo_trabajos_url
  end
end
