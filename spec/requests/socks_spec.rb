require 'rails_helper'

RSpec.describe "Socks", type: :request do
  describe "GET /socks" do
    it "works! (now write some real specs)" do
      get socks_path
      expect(response).to have_http_status(200)
    end
  end
end
