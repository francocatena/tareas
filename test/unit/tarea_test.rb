# encoding: UTF-8

require 'test_helper'

class TareaTest < ActiveSupport::TestCase
  fixtures :tareas

  def setup
    @tarea = Tarea.find(tareas(:ir_al_curso).id)
  end

  test 'el nombre no puede estar en blanco' do
    @tarea.nombre = ''
    assert @tarea.invalid?
    assert_equal 1, @tarea.errors.size
    assert_equal 'no debe estar en blanco', @tarea.errors[:nombre][0]
  end

  test 'el detalle no puede estar en blanco' do
    @tarea.detalles = ''
    assert @tarea.invalid?
    assert_equal 1, @tarea.errors.size
    assert_equal 'no debe estar en blanco', @tarea.errors[:detalles][0]
  end

  test 'la fecha debe estar bien formada' do
    @tarea.fecha = '13/13/13'
    assert @tarea.invalid?
    assert_equal 1, @tarea.errors.size
    assert_equal 'está mal formada', @tarea.errors[:fecha][0]
  end
  
  test 'la fecha debe ser para hoy o el futuro' do
    @tarea.fecha = Date.yesterday
    assert @tarea.invalid?
    assert_equal 1, @tarea.errors.size
    assert_equal 'debe ser para hoy o el futuro', @tarea.errors[:fecha][0]
  end
end
