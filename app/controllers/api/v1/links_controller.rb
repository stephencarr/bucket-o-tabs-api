class LinksController < ApplicationController
  def create
    # TODO Auth, or generate forward URL with ID to auth
    Links.find_or_create_by(url: params[:url])
  end
end
