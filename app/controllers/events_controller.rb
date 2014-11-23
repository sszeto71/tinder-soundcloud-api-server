class API::Users::EventsController < ApplicationController

  def create
    # find user
    @user = User.find(params[:user_id])

    # find song or create one
    begin
      @song = Song.find_by(soundcloud_id: params[:soundcloud_id])
    rescue
      @song = nil
    end
    if @song.nil?
      @song = Song.create(soundcloud_id: params[:soundcloud_id], genre: params[:genre], song_url: params[:song_url])
    end

    # save event
    @event = @user.event.build(:user_id => @user.id, :song_id => @song.id, :like => params[:like])
    if @event.save

  end

end
