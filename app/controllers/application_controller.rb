class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :check_header
  private
    def check_header
      if ['POST','PUT','PATCH'].include? request.method
        if request.content_type != "application/json"
          head 406 and return
        end
      end
    end
    def render_error(resource, status)
      render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer, meta: default_meta
    end
    def default_meta
      {
        logged_in: (current_v1_user ? true : false)
      }
    end
end
