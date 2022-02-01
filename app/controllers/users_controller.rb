class UsersController < ApplicationController
  before_action :check_if_logged_in, except: [:new, :create]


  def show
    @user = User.find_by(id: @current_user.id)
  end

  def edit
    @user = User.find_by(id: @current_user.id)
    redirect_to login_path unless @user.id == @current_user.id 
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find  @current_user.id
    if @user.update user_info_params
      redirect_to user_path(@current_user.id)
    else
      render :edit
    end
  end

  def create
    @user = User.new user_create_password
    @user.save
    if  @user.persisted?
      create_session(@user.email, @user.password)  
    else
      render :new                                                                                                                                                
    end
  end

  def change_password
    @user = User.find_by(id: @current_user.id)
  end

  def update_password
    @user = User.find  @current_user.id
    if  @user.authenticate(params[:user][:old_password])
      if @user.update(user_change_password)
          redirect_to user_path(@current_user.id)
      else
        render :change_password
      end
    else
      @user.errors.add :old_password, "wrong"
      render :change_password
    end
  end

  private def user_info_params
    params.require(:user).permit(:name, :last_name, :email, :dob)
  end

  private def user_create_password
    params.require(:user).permit(:name, :last_name, :email, :dob,:password, :password_confirmation)
  end

  private def user_change_password
    params.require(:user).permit(:password, :password_confirmation)
  end
end
