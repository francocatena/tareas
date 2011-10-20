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

  test 'el salt y la clave cifrada se asignan cuando creamos un responsable' do
    @responsable = Responsable.create(
      nombre: 'Franco', correo: 'p@t.com', clave: '123'
    )
    assert @responsable.salt.present?
    assert @responsable.clave_cifrada.present?
    assert @responsable.clave_valida?('123')
  end

  test 'buscar por nombre' do
    responsables = Responsable.con_nombre 'fr'

    assert_equal 1, responsables.size
    assert_equal 'Franco', responsables.first.nombre

    responsables = Responsable.con_nombre 'xx'

    assert_equal 0, responsables.size
  end
end
