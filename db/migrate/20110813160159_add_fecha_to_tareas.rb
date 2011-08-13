class AddFechaToTareas < ActiveRecord::Migration
  def self.up
    add_column :tareas, :fecha, :date
    
    add_index :tareas, :fecha
  end

  def self.down
    remove_index :tareas, :column => [:fecha]

    remove_column :tareas, :fecha
  end
end
