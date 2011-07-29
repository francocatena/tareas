class Tarea < ActiveRecord::Base
  validates :nombre, :detalles, :presence => true
end
