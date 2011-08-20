class CreateResponsables < ActiveRecord::Migration
  def self.up
    create_table :responsables do |t|
      t.string :nombre
      t.string :correo

      t.timestamps
    end
  end

  def self.down
    drop_table :responsables
  end
end
