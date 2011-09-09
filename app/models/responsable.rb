# encoding: UTF-8
require 'digest/sha2'

class Responsable < ActiveRecord::Base
  # Ganchos
  before_save :asignar_clave_cifrada

  # Atributos no persistentes
  attr_accessor :clave

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

  def generar_salt
    self.salt = Digest::SHA512.hexdigest(rand.to_s)
  end

  def asignar_clave_cifrada
    self.generar_salt if self.salt.blank?

    self.clave_cifrada = cifrar_clave(self.clave) unless self.clave.blank?
  end

  def cifrar_clave(clave)
    Digest::SHA512.hexdigest(self.salt + clave)
  end

  def clave_valida?(clave)
    self.clave_cifrada == cifrar_clave(clave)
  end
end
