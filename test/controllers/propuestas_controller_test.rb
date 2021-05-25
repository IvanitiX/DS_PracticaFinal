require "test_helper"

class PropuestasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @propuesta = propuestas(:one)
  end

  test "should get index" do
    get propuestas_index_url
    assert_response :success
  end

  test "should get new" do
    get new_propuesta_url
    assert_response :success
  end

  test "should create propuesta" do
    assert_difference('Propuestas.count') do
      post propuestas_index_url, params: { propuesta: { id_tecnico: @propuesta.id_tecnico, id_trabajo: @propuesta.id_trabajo } }
    end

    assert_redirected_to propuesta_url(Propuestas.last)
  end

  test "should show propuesta" do
    get propuesta_url(@propuesta)
    assert_response :success
  end

  test "should get edit" do
    get edit_propuesta_url(@propuesta)
    assert_response :success
  end

  test "should update propuesta" do
    patch propuesta_url(@propuesta), params: { propuesta: { id_tecnico: @propuesta.id_tecnico, id_trabajo: @propuesta.id_trabajo } }
    assert_redirected_to propuesta_url(@propuesta)
  end

  test "should destroy propuesta" do
    assert_difference('Propuestas.count', -1) do
      delete propuesta_url(@propuesta)
    end

    assert_redirected_to propuestas_index_url
  end
end
