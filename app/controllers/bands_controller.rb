class BandsController < ApplicationController

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @user.errors.full_messages
      render :new
    end
    
  end
  
  def edit
    @band = Band.find(params[:id])
    render :edit
  end
  
  def update
    @band = Band.find(params[:id])
    @band.update_attributes(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @band.errors.full_messages
      render :new
    end
  end
  
  def new
    @band = Band.new
    render 'new'
  end
  
  def index
    @bands = Band.all
    render 'index'
  end
  
  def show
    @band = Band.find(params[:id])
    render :show
  end

  private
  
  def band_params
    params.require(:band).permit(:name, :genre, :band_pic_url)
  end

end
