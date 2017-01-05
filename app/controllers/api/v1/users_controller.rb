module Api::V1
  class UsersController < ApplicationController
    before_action :authenticate_v1_user!
    before_action :set_user, only: [:show, :me, :the, :money]
    def me
      render json: @user
    end
    private
      def set_user
        @user = current_v1_user
      end
  end
end
