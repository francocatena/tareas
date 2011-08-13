# encoding: UTF-8

class Tarea < ActiveRecord::Base
  validates :nombre, :detalles, :presence =>  {
    :message => 'no debe estar en blanco'
  }
  validates :fecha, :timeliness => {
    :type => :date,
    :on_or_after => lambda { Date.today },
    :invalid_date_message => 'está mal formada',
    :on_or_after_message => 'debe ser para hoy o el futuro'
  }
end
