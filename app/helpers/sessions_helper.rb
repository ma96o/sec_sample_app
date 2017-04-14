module SessionsHelper

  # 渡されたユーザでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  def remember(user)
    # 渡されたユーザをrememeber_digestとしてDBに保存する
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # if @current_user.nil?
    #   @user = User.find_by(id: session[:user_id])
    # else
    #   @current_user
    # end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
