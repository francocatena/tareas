# encoding: UTF-8

require 'test_helper'

class ResponsableTest < ActiveSupport::TestCase
  fixtures :responsables

  def setup
    @responsable = Responsable.find(responsables(:franco).id)
  end

  test 'el nombre no puede estar en blanco' do
    @responsable.nombre = ''
    assert @responsable.invalid?
    assert_equal 1, @responsable.errors.size
    assert_equal 'no debe estar en blanco', @responsable.errors[:nombre][0]
  end

  test 'el correo no puede estar en blanco' do
    @responsable.correo = ''
    assert @responsable.invalid?
    assert_equal 2, @responsable.errors.size
    assert_equal ['no debe estar en blanco', 'está mal formado'].sort,
      @responsable.errors[:correo].sort
  end

  test 'el correo debe estar bien formado' do
    @responsable.correo = 'correo@invalido'
    assert @responsable.invalid?
    assert_equal 1, @responsable.errors.size
    assert_equal 'está mal formado', @responsable.errors[:correo][0]
  end
end
