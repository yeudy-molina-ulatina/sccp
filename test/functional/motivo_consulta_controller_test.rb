require 'test_helper'

class MotivoConsultaControllerTest < ActionController::TestCase
  setup do
    @motivo_consultum = motivo_consulta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motivo_consulta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motivo_consultum" do
    assert_difference('MotivoConsultum.count') do
      post :create, motivo_consultum: @motivo_consultum.attributes
    end

    assert_redirected_to motivo_consultum_path(assigns(:motivo_consultum))
  end

  test "should show motivo_consultum" do
    get :show, id: @motivo_consultum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @motivo_consultum
    assert_response :success
  end

  test "should update motivo_consultum" do
    put :update, id: @motivo_consultum, motivo_consultum: @motivo_consultum.attributes
    assert_redirected_to motivo_consultum_path(assigns(:motivo_consultum))
  end

  test "should destroy motivo_consultum" do
    assert_difference('MotivoConsultum.count', -1) do
      delete :destroy, id: @motivo_consultum
    end

    assert_redirected_to motivo_consulta_path
  end
end
