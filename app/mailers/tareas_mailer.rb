#encoding: UTF-8

class TareasMailer < ActionMailer::Base
  default from: 'tareasrails@yahoo.com.ar'

  def tarea_cerca_de_vencer(tarea)
    @tarea = tarea
    @responsable = tarea.responsable
    
    mail(to: @responsable.correo, subject: '¡Ya se vence!')
  end
end
