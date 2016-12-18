module Api::V1
  class LinksController < ApplicationController
    def create
      # TODO Auth, or generate forward URL with ID to auth
      @link = Link.find_or_create_by(link_params)
      User.find(1).links << @link
      # TODO stantardize this response pattern
      # TODO make payload go through serializer
      if @link.save
        render json: { success: true, payload: @link }
      else
        render json: { success: false, errors: @link.errors.full_messages.as_json }, status: 400
      end
    end

    private
      def link_params
        params.require(:link).permit(:url)
      end
  end
end
