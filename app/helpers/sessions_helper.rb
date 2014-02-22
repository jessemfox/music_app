module SessionsHelper


  # def log_in!(user)
 #    user.reset_session_token!
 #    session[:session_token] = user.session_token
 #  end
 # 
 # 
 #  def current_user
 #    return nil if session[:session_token].nil?
 #    @current_user ||= User.find_by_session_token(session[:session_token])
 #  end
 #  
 #  def logged_in?
 #    return false if session[:sesssion_token].nil?
 #    session[:session_token] == current_user.session_token
 #  end
end
