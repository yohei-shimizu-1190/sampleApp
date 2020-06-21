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

  def edit
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
    if @song.update(song_params)
      redirect_to action: :index
    else
      render :edit
    end
  end


  def destroy
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
    @song.destroy
    redirect_to action: :index
  end

  private
  def song_params
    params.require(:song).permit(:title, :point).merge(artist_id: params[:artist_id])
  end
end
