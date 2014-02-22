class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def index
    
  end
  
  def create
    @user = User.create(user_params)
    if @user.save
      log_in!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @user.errors.full_messages
      render :new
    end
  end
  
  def new
    @user = User.new
    render :new
  end
  
  


  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
