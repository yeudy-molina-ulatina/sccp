require 'test_helper'

class AsignacionesControllerTest < ActionController::TestCase
  setup do
    @asignacion = asignaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asignaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asignacion" do
    assert_difference('Asignacion.count') do
      post :create, asignacion: @asignacion.attributes
    end

    assert_redirected_to asignacion_path(assigns(:asignacion))
  end

  test "should show asignacion" do
    get :show, id: @asignacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asignacion
    assert_response :success
  end

  test "should update asignacion" do
    put :update, id: @asignacion, asignacion: @asignacion.attributes
    assert_redirected_to asignacion_path(assigns(:asignacion))
  end

  test "should destroy asignacion" do
    assert_difference('Asignacion.count', -1) do
      delete :destroy, id: @asignacion
    end

    assert_redirected_to asignaciones_path
  end
end
