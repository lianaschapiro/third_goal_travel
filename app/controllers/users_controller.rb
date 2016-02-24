class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for joining!"
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      flash[:notice] = "Your account has been updated"
    else
      flash[:notice] = "Unable to update your account"
    redirect_to @user
  end

  def destroy
    @user = current_user
    if @user.destroy
      session.clear
      flash[:notice] = "Your account was deleted"
    else
      flash[:notice] = "Unable to delete your account"
    end
    redirect_to root_path
  end

  private   
   def user_params
      params.require(:user).permit(:fname, :lname, :email, :password, :about, :admin, :volunteer)  
   end
   
end
