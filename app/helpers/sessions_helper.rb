module SessionsHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def current_user?(user)
    user == current_user
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end

  def require_login
    unless logged_in?
      flash[:danger] = 'ログインしてください'
      redirect_to login_path # ログインページへのパスに変更する必要があります
    end
  end
end
