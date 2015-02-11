class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username].downcase)
    if user && user.authenticate( params[:password] )
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid email or password :("
      render action: 'new'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
