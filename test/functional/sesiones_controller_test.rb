# encoding: UTF-8

require 'test_helper'

class SesionesControllerTest < ActionController::TestCase
  test 'deberia ver new' do
    get :new
    assert_response :success
  end

  test 'deberia crear una sesion' do
    post :create, { :correo => responsables(:obi).correo, :clave => '123' }

    assert session[:responsable_id]
    assert_redirected_to tareas_url
  end

  test 'no deberia crear una sesion' do
    post :create, { :correo => responsables(:obi).correo, :clave => 'erronea' }

    assert_nil session[:responsable_id]
    assert_response :success
  end

  test 'deberia cerrar la sesion' do
    identificarse

    assert session[:responsable_id]

    delete :destroy

    assert_redirected_to nueva_sesion_url

    assert_nil session[:responsable_id]
  end
end
