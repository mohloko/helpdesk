module SessionsHelper
  #Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Retorna true se o certo usuario eh o usuario atual
  def current_user?(user)
    user == current_user
  end
  
  #retorna o usuario corrente (se tiver)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) # ||= eh o mesmo que @current = @current 
  end
  
  #retorna true se usuario estiver logado senao false
  def logged_in?
    !current_user.nil?
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Redireciona para stored location (or to the default)
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  
  # armazena url que deseja ir
  def store_location
      session[:forwarding_url] = request.original_url if request.get?
  end
  
  
end
