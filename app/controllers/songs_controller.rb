class SongsController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs.order('point DESC')
  end

  def new

    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  def song_params
    params.require(:song).permit(:title, :point).merge(artist_id: params[:artist_id])
  end
end
