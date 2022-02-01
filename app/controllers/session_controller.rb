class SessionController < ApplicationController
  
  def new
  end

  def create
    create_session(params[:email], params[:password]);
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
