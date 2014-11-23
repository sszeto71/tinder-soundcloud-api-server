class Api::SongsController < ApplicationController

  def show
    content_type :json

    @song = Song.find_by song_id: params[:id]
    @song.to_json
  end

  private
  def song_params
    params.require(:song).permit(:id, :genre, :song_url)
  end
end
