class AddCompletaToTareas < ActiveRecord::Migration
  def change
    add_column :tareas, :completa, :boolean, :null => false, :default => false
  end
end
