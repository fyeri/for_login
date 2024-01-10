class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_required
  add_flash_types :info, :error, :warning

private

  def login_required
    unless current_user
      flash[:error] = "ログインしてください"
      redirect_to new_session_path
    end
  end

  # def require_loginexi
  #   unless session[:user_id]

  #     flash[:error] = “ログインしてください”
  #     redirect_to login_path
  #   end
  # end

  def logged_in_user
    unless logged_in?
      redirect_to task_path
    end
  end
end
