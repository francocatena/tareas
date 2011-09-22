module TareasHelper
  def responsables_array_for_select
    Responsable.order('nombre ASC').all.map { |r| [r.nombre, r.id] }
  end

  def mostrar_responsable(tarea)
    texto = tarea.completa ? 'Esta tarea la hizo ' : 'Esta tarea la debe hacer '

    content_tag :p, raw("#{texto} #{content_tag(:strong, tarea.responsable)}")
  end
end
