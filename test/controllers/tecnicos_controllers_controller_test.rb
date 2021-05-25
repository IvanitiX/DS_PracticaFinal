require "test_helper"

class TecnicosControllersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tecnicos_controller = tecnicos_controllers(:one)
  end

  test "should get index" do
    get tecnicos_controllers_url
    assert_response :success
  end

  test "should get new" do
    get new_tecnicos_controller_url
    assert_response :success
  end

  test "should create tecnicos_controller" do
    assert_difference('TecnicosController.count') do
      post tecnicos_controllers_url, params: { tecnicos_controller: {  } }
    end

    assert_redirected_to tecnicos_controller_url(TecnicosController.last)
  end

  test "should show tecnicos_controller" do
    get tecnicos_controller_url(@tecnicos_controller)
    assert_response :success
  end

  test "should get edit" do
    get edit_tecnicos_controller_url(@tecnicos_controller)
    assert_response :success
  end

  test "should update tecnicos_controller" do
    patch tecnicos_controller_url(@tecnicos_controller), params: { tecnicos_controller: {  } }
    assert_redirected_to tecnicos_controller_url(@tecnicos_controller)
  end

  test "should destroy tecnicos_controller" do
    assert_difference('TecnicosController.count', -1) do
      delete tecnicos_controller_url(@tecnicos_controller)
    end

    assert_redirected_to tecnicos_controllers_url
  end
end
