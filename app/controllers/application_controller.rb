class ApplicationController < ActionController::Base
  helper_method :responsable_actual

  protect_from_forgery

  def responsable_actual
    if session[:responsable_id]
      @responsable_actual ||= Responsable.find(session[:responsable_id])
    end
  end

  def requerir_responsable
    unless responsable_actual
      redirect_to nueva_sesion_url

      false
    end
  end

  def no_requerir_responsable
    if responsable_actual
      redirect_to tareas_url

      false
    end
  end
end
