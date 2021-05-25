require "test_helper"

class EstadoPropuestaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estado_propuestum = estado_propuesta(:one)
  end

  test "should get index" do
    get estado_propuesta_url
    assert_response :success
  end

  test "should get new" do
    get new_estado_propuestum_url
    assert_response :success
  end

  test "should create estado_propuestum" do
    assert_difference('EstadoPropuestum.count') do
      post estado_propuesta_url, params: { estado_propuestum: { estado: @estado_propuestum.estado } }
    end

    assert_redirected_to estado_propuestum_url(EstadoPropuestum.last)
  end

  test "should show estado_propuestum" do
    get estado_propuestum_url(@estado_propuestum)
    assert_response :success
  end

  test "should get edit" do
    get edit_estado_propuestum_url(@estado_propuestum)
    assert_response :success
  end

  test "should update estado_propuestum" do
    patch estado_propuestum_url(@estado_propuestum), params: { estado_propuestum: { estado: @estado_propuestum.estado } }
    assert_redirected_to estado_propuestum_url(@estado_propuestum)
  end

  test "should destroy estado_propuestum" do
    assert_difference('EstadoPropuestum.count', -1) do
      delete estado_propuestum_url(@estado_propuestum)
    end

    assert_redirected_to estado_propuesta_url
  end
end
