class SessionController < ApplicationController
  
  def new
  end
  def create
    #1 Check if email entered is in the db at all
    user = User.find_by email: params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to trades_path
    else
      #Either user was nill or invalid password
      redirect_to login_path
      flash[:error] = "Bad Credentials, try again."
    end
end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
