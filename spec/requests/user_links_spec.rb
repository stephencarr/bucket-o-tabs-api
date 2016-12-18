require 'rails_helper'

RSpec.describe "UserLinks", type: :request do
  describe "GET /user_links" do
    it "works! (now write some real specs)" do
      get user_links_path
      expect(response).to have_http_status(200)
    end
  end
end
