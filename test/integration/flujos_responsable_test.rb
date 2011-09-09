require 'test_helper'

class FlujosResponsableTest < ActionDispatch::IntegrationTest
  fixtures :all

  test 'ingresar y ver tareas y responsables' do
    get '/'
    assert_response :success
  
    post_via_redirect '/sesiones', {
      :correo => responsables(:obi).correo,
      :clave => '123'
    }
    assert_equal '/tareas', path

    get '/responsables'
    assert_response :success
    assert assigns(:responsables)
  end
end
