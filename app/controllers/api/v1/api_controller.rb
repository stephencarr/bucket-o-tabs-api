# app/controllers/api/v1/api_controller.rb

module Api::V1
  class ApiController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken
    include ActionController::Serialization
  end
end
