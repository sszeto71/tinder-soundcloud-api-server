# module Api
  class SongsController < ApplicationController

   include ActionController::MimeResponds
   include ActionController::ImplicitRender
   respond_to :json

    def show
      # content_type :json

      @song = Song.find_by song_id: params[:id]
      @song.to_json
    end

    private
    def song_params
      params.require(:song).permit(:id, :genre, :song_url)
    end
  end
# end
