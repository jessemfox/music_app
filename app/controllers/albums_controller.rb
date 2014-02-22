class AlbumsController < ApplicationController

  def create
    @band = Band.find(params[:band_id])
    @album = Album.new(album_params)
    @album.band_id = @band.id
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @album.errors.full_messages
      render :new
    end
    
  end
  
  def edit
    @album = Album.find(params[:id])
    render :edit
  end
  
  def update
    @album = Album.find(params[:id])
    @album.update_attributes(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @album.errors.full_messages
      render :new
    end
  end
  
  def new
    @band = Band.find(params[:band_id])
    @album = Album.new
    render 'new'
  end
  
  def index
    band = params[:band_id]
    @albums = Album.where("band_id = ?", band)
    render 'index'
  end
  
  def show
    @album = Album.find(params[:id])
    @band = Band.find(@album.band_id)
    render :show
  end

  private
  
  def album_params
    params.require(:album).permit(:name, :band_id, :album_type)
  end



end
