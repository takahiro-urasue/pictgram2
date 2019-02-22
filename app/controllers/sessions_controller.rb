class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to topics_path, success: 'Login succeeded'
    else
      flash.now[:danger] = 'Login failed'
      render :new
    end
  end


  def destroy
    log_out
    redirect_to root_url, info: 'Logged out'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end

private
def session_params
  params.require(:session).permit(:email, :password)
end
