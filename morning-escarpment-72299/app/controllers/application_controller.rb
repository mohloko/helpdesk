class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper #consultar livro
  
  # Confirma se usuario esta logado
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Por favor faça o login!"
      redirect_to login_url
    end
  end
end
