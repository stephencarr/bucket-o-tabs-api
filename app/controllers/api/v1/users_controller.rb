module Api::V1
  class UsersController < ApplicationController
    before_action :authenticate_v1_user!
    before_action :set_user, only: [:show]
    def index
      @users = User.all
      render json: @users
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  end
end
