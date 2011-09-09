# encoding: UTF-8

require 'test_helper'

class ResponsablesControllerTest < ActionController::TestCase
  setup do
    @responsable = responsables(:obi)
    identificarse
  end

  test 'deberia ver index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:responsables)
  end

  test 'deberia ver new' do
    get :new
    assert_response :success
  end

  test 'deberia crear un responsable' do
    assert_difference 'Responsable.count' do
      post :create, :responsable => {
        :nombre => 'Jar Jar',
        :correo => 'jj@sw.com',
        :clave => '123',
      }
    end

    assert_redirected_to responsable_path(assigns(:responsable))
  end

  test 'deberia mostrar show' do
    get :show, :id => @responsable.to_param
    assert_response :success
  end

  test 'deberia mostrar edit' do
    get :edit, :id => @responsable.to_param
    assert_response :success
  end

  test 'deberia actualizar un responsable' do
    put :update, :id => @responsable.to_param, :responsable => {
      :nombre => 'Obbi'
    }
    assert_redirected_to responsable_path(assigns(:responsable))
    assert_equal 'Obbi', @responsable.reload.nombre
  end

  test 'deberia eliminar un responsable' do
    assert_difference 'Responsable.count', -1 do
      delete :destroy, :id => @responsable.to_param
    end

    assert_redirected_to responsables_path
  end
end
