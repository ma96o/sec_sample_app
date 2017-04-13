module SessionsHelper

  # 渡されたユーザでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # if @current_user.nil?
    #   @user = User.find_by(id: session[:user_id])
    # else
    #   @current_user
    # end
  end
end
