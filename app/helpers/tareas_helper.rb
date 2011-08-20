module TareasHelper
  def responsables_array_for_select
    Responsable.order('nombre ASC').all.map { |r| [r.nombre, r.id] }
  end
end
