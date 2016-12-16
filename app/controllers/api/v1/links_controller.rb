class LinksController < ApplicationController
  def create
    Links.find_or_create_by(url: params[:url])
  end
end
