class UsersController < ApplicationController
  def create
    content_type :json

    begin
      if @user = User.find(params[:user][:id])
        return {user_id: @user.id}.to_json
      end
    rescue
      @user = nil
    end

    @user = User.new(params)
    if @user.save
      return {user_id: @user.id}.to_json
    end
  end

  def show
    content_type :json

    @user = User.find_by soundcloud_id: params[:soundcloud_id]
    @user.to_json
  end

  private
  def user_params
    params.require(:user).permit(:fullname, :soundcloud_id)
  end

end


