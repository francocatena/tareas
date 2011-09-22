# encoding: UTF-8

require 'test_helper'

class TareasControllerTest < ActionController::TestCase
  setup do
    @tarea = tareas(:ir_al_curso)
    identificarse
  end

  test 'deberia ver index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:tareas)
  end

  test 'deberia ver new' do
    get :new
    assert_response :success
  end

  test 'deberia crear una tarea' do
    assert_difference 'Tarea.count' do
      post :create, :tarea => {
        :nombre => 'Ir a la conferencia',
        :detalles => 'Es al lado del Ángel Bustelo',
        :fecha => Date.tomorrow.to_s(:db)
      }
    end

    assert_redirected_to tarea_path(assigns(:tarea))
  end

  test 'deberia ver show' do
    get :show, :id => @tarea.to_param
    assert_response :success
  end

  test 'deberia ver edit' do
    get :edit, :id => @tarea.to_param
    assert_response :success
  end

  test 'deberia actualizar una tarea' do
    put :update, :id => @tarea.to_param, :tarea => {
      :nombre => 'Ir si o si al curso'
    }
    assert_redirected_to tarea_path(assigns(:tarea))
    assert_equal 'Ir si o si al curso', @tarea.reload.nombre
  end

  test 'deberia eliminar una tarea' do
    assert_difference 'Tarea.count', -1 do
      delete :destroy, :id => @tarea.to_param
    end

    assert_redirected_to tareas_path
  end
end
