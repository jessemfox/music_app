class SessionsController < ApplicationController


  def create
    @user = User.find_by_credentials(
    params[:user][:email],
    params[:user][:password])
    unless @user.nil?
      log_in!(@user)
      redirect_to bands_url
    else
      flash.now ||= []
      flash.now[:errors] = ['incorrct shit']
      render :new
    end
    
  end
  
  def new
    render :new
  end
  
  def destroy
    user = current_user
    session[:session_token] = nil
    user.reset_session_token! unless user.nil?
    redirect_to bands_url
  end


end
