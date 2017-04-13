class SessionsController < ApplicationController
  def new ; end

  def create
    user = User.find_by(email: login_params[:email].downcase)
    if user && user.authenticate(login_params[:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "invalid email/password combination"
      render 'new'
    end
  end

  def destroy ; end

  private
    def login_params
      params.require(:session).permit(:email, :password)
    end
end
