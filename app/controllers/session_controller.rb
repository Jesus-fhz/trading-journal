class SessionController < ApplicationController
  
  def new
    #render :layout => 'application'
    #render :layout => 'panel'
  end

  def index
    render :layout => 'application'
  end

  def create
    create_session(params[:email], params[:password]);
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
