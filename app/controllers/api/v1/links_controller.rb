module Api::V1
  class LinksController < ApplicationController
    before_action :authenticate_v1_user!
    before_filter :require_no_authentication, only: :create

    def index
      authenticate_v1_user!
      @links = current_v1_user.links
      render json: @links
    end

    def create
      # TODO Auth, or generate forward URL with ID to auth
      # TODO stantardize this response pattern
      # TODO make payload go through serializer
      @link = Link.find_or_create_by(link_params)
      if current_v1_user
        current_v1_user.links << @link
        render json: @link
      else
        if @link.save
          render json: { data: "#{@client_url}/login?link_id=#{@link.id}" }
        else
          render json: { errors: @link.errors.full_messages.as_json }, status: 400
        end
      end
    end

    private
      def link_params
        params.require(:link).permit(:url)
      end
  end
end
