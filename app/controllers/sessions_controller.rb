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
    #@uu=User.create(1944240638965356)
    #raise @uu.inspect

    if  params[:user]
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Welcome back, #{@user.username}!"
      else
        redirect_to signin_path
      end
    else
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        #raise auth.inspect
        u.username = auth['info']['name']
        u.email = auth['info']['email']
        u.first_name=auth['info']['name']
        u.last_name=auth['info']['name']
      end
        @user.id=@user.uid
        @user.save
        session[:user_id] = @user.try(:id)
        #raise @user.inspect
        redirect_to user_path(@user), notice: "Welcome back, #{@user.username}!"
    end

  end

  def auth
    request.env['omniauth.auth']
  end

end
