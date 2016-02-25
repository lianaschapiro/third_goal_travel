class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.where(email: params[:email]).first   
    if @user && @user.authenticate(params[:password])     
      session[:user_id] = @user.id     
      flash[:notice] = "Welcome back!"
      redirect_to root_path
    else     
      flash[:notice] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
  	@user = current_user
	if @user
    flash[:notice] = "Come back again soon!"
		session[:user_id] = nil
    redirect_to root_path
	end
  end


end
