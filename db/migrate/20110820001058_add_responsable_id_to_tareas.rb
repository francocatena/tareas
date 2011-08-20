class AddResponsableIdToTareas < ActiveRecord::Migration
  def self.up
    add_column :tareas, :responsable_id, :integer

    add_index :tareas, :responsable_id
  end

  def self.down
    remove_index :tareas, :column => [:responsable_id]

    remove_column :tareas, :responsable_id
  end
end
