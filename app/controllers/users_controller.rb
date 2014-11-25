# module Api
  require 'json'

  class UsersController < ApplicationController

      include ActionController::MimeResponds
      include ActionController::ImplicitRender

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
      content_type "json"

      @user = User.find(params[:user][:id])

      begin
        if !@user.nil?
          render json: @user
        end
      rescue
        render json: none
      end

      @user = User.new(user_params)
      if @user.save
        # return {user_id: @user.id}.to_json
        render json: @user
      end
    end

    def show
      content_type "json"

      @user = User.find_by soundcloud_id: params[:soundcloud_id]
      # @user.to_json
      render json: @user
    end

    private
    def user_params
      params.require(:user).permit(:fullname, :soundcloud_id)
    end

  end
# end


