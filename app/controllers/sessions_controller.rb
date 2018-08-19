class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def new
    @user = User.new
    @users = User.all
  end

  def create
    if !@user = User.find_by(username: params[:user][:username])
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        raise auth.inspect
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.first_name=auth['info']['']
    end
    end
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome back, #{@user.username}!"
    else
      redirect_to signin_path
    end
  end

end
