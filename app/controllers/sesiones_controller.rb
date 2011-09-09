# encoding: UTF-8

class SesionesController < ApplicationController
  before_filter :no_requerir_responsable, only: [:new, :create]
  before_filter :requerir_responsable, only: :destroy

  # GET /sesiones/new
  def new
  end

  def create
    responsable = Responsable.find_by_correo(params[:correo])
    
    respond_to do |format|
      if responsable && responsable.clave_valida?(params[:clave])
        session[:responsable_id] = responsable.id

        format.html { redirect_to(tareas_url, notice: 'Ingreso correcto') }
      else
        flash.now.notice = 'Usuario y/o contraseña incorrecto'

        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    reset_session

    respond_to do |format|
      format.html { redirect_to nueva_sesion_url, notice: 'Sesión cerrada' }
    end
  end
end
