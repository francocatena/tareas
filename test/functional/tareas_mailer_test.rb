#encoding: UTF-8

require 'test_helper'

class TareasMailerTest < ActionMailer::TestCase
  test 'tarea cerca de vencer' do
    tarea = tareas(:ir_al_curso)
    mail = TareasMailer.tarea_cerca_de_vencer(tarea)
    assert_equal '¡Ya se vence!', mail.subject
    assert_equal [tarea.responsable.correo], mail.to
    assert_equal ['tareasrails@yahoo.com.ar'], mail.from
    assert_match "Hola #{tarea.responsable.nombre}", mail.body.encoded
    
    assert_difference 'ActionMailer::Base.deliveries.size' do
      mail.deliver
    end
  end
end
