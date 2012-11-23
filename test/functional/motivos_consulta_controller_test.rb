require 'test_helper'

class MotivosConsultaControllerTest < ActionController::TestCase
  setup do
    @motivo_consulta = motivos_consulta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motivos_consulta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motivo_consulta" do
    assert_difference('MotivoConsulta.count') do
      post :create, motivo_consulta: @motivo_consulta.attributes
    end

    assert_redirected_to motivo_consulta_path(assigns(:motivo_consulta))
  end

  test "should show motivo_consulta" do
    get :show, id: @motivo_consulta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @motivo_consulta
    assert_response :success
  end

  test "should update motivo_consulta" do
    put :update, id: @motivo_consulta, motivo_consulta: @motivo_consulta.attributes
    assert_redirected_to motivo_consulta_path(assigns(:motivo_consulta))
  end

  test "should destroy motivo_consulta" do
    assert_difference('MotivoConsulta.count', -1) do
      delete :destroy, id: @motivo_consulta
    end

    assert_redirected_to motivos_consulta_path
  end
end
