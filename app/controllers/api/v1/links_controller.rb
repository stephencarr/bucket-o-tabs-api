module Api::V1
  class LinksController < ApplicationController
    before_action :authenticate_v1_user!

    def index
      authenticate_v1_user!
      @links = current_v1_user.links.order(created_at: :desc)
      if params[:limit].present?
        render json: @links.limit(params[:limit])
      else
        paginate json: @links, per_page: 10
      end
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

    def destroy
      @link = current_v1_user.links.find params[:id]
      @link.destroy
    end

    private
      def link_params
        params.require(:data)
          .require(:attributes)
          .permit(:url, :title, :description)
      end
  end
end
