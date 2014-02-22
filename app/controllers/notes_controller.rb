class NotesController < ApplicationController

  #created routes now write the method
  #finish create
  def create
    @note = Note.new(note_params)
    if logged_in?
      @note.user_id = current_user
      @note.track_id = Track.find(params[:track_id])
    end
    
  end
  
  def index
    
  end
  



  private
  
  def note_params
    params.require(:note).permit(:body)
  end

end
