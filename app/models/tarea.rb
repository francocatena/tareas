class Tarea < ActiveRecord::Base
  validates :nombre, :detalles, :presence =>  {
    :message => 'no debe estar en blanco'
  }
end
