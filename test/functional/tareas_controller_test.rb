require 'test_helper'

class TareasControllerTest < ActionController::TestCase
  setup do
    @tarea = tareas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tareas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tarea" do
    assert_difference('Tarea.count') do
      post :create, :tarea => @tarea.attributes
    end

    assert_redirected_to tarea_path(assigns(:tarea))
  end

  test "should show tarea" do
    get :show, :id => @tarea.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tarea.to_param
    assert_response :success
  end

  test "should update tarea" do
    put :update, :id => @tarea.to_param, :tarea => @tarea.attributes
    assert_redirected_to tarea_path(assigns(:tarea))
  end

  test "should destroy tarea" do
    assert_difference('Tarea.count', -1) do
      delete :destroy, :id => @tarea.to_param
    end

    assert_redirected_to tareas_path
  end
end
