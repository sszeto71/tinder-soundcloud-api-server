class SongsController < ApplicationController

  def show
    content_type :json

    @song = Song.find_by song_id: params[:song_id]
    @user.to_json
  end

  private
  def user_params
    params.require(:user).permit(:song_id, :genre, :song_url)
  end
end
