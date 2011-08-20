# encoding: UTF-8

class Tarea < ActiveRecord::Base
  # Restricciones
  validates :nombre, :detalles, :presence =>  {
    :message => 'no debe estar en blanco'
  }
  validates :fecha, :timeliness => {
    :type => :date,
    :invalid_date_message => 'está mal formada'
  }
  validates :fecha, :on => :create, :timeliness => {
    :type => :date,
    :on_or_after => :today,
    :on_or_after_message => 'debe ser para hoy o el futuro'
  }

  # Relaciones
  belongs_to :responsable
end
