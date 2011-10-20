# encoding: UTF-8

class Tarea < ActiveRecord::Base
  # Atributos no persistentes
  attr_accessor :auto_responsable

  before_validation :asignar_responsable

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

  def to_s
    self.nombre
  end

  def asignar_responsable
    if self.auto_responsable.present?
      self.responsable = Responsable.find_by_nombre(self.auto_responsable)
    end
  end

  def self.recordar_vencimientos
    tareas = Tarea.where(
      [
        'fecha BETWEEN :hoy AND :futuro',
        'responsable_id IS NOT NULL',
        'completa = :false'
      ].join(' AND '),
      hoy: Date.today,
      futuro: 3.days.from_now.to_date,
      false: false
    )

    tareas.each do |tarea|
      TareasMailer.tarea_cerca_de_vencer(tarea).deliver
    end
  end
end
