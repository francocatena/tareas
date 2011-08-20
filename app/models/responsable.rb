# encoding: UTF-8

class Responsable < ActiveRecord::Base
  # Restricciones
  validates :nombre, :presence => {
    :message => 'no debe estar en blanco'
  }
  validates :correo, :presence => {
    :message => 'no debe estar en blanco'
  }, :format => {
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    :message => 'está mal formado'
  }

  # Relaciones
  has_many :tareas, :dependent => :destroy

  def to_s
    self.nombre
  end
end
