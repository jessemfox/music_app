class TracksController < ApplicationController

  def create
    @album = Album.find(params[:album_id])
    @track = Track.new(track_params)
    @track.album_id = @album.id
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @track.errors.full_messages
      render :new
    end
    
  end
  
  def edit
    @track = Track.find(params[:id])
    render :edit
  end
  
  def update
    @track = Track.find(params[:id])
    @track.update_attributes(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @track.errors.full_messages
      render :new
    end
  end
  
  def new
    @album = Album.find(params[:album_id])
    @track = Track.new
    render 'new'
  end
  
  def index
    album = params[:album_id]
    @tracks = Album.where("album_id = ?", album)
    render 'index'
  end
  
  def show
    @track = Track.find(params[:id])
    @album = Album.find(@track.album_id)
    render :show
  end

  private
  
  def track_params
    params.require(:track).permit(:title, :album_id, :track_type, :lyrics)
  end

end
