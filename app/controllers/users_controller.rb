class UsersController < ApplicationController

    def index
        set_cors_headers
    end

    def set_cors_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end

  def create
    set_cors_headers
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


