class AddAuthFieldsToResponsable < ActiveRecord::Migration
  def self.up
    add_column :responsables, :clave_cifrada, :string
    add_column :responsables, :salt, :string

    add_index :responsables, :correo
  end

  def self.down
    remove_column :responsables, column: [:clave_cifrada]
    remove_column :responsables, column: [:salt]

    remove_index :responsables, :correo
  end
end
