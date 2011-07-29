class AddDetallesToTareas < ActiveRecord::Migration
  def self.up
    add_column :tareas, :detalles, :text
  end

  def self.down
    remove_column :tareas, :detalles
  end
end
