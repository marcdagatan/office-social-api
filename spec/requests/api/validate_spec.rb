require "rails_helper"

describe "GET /api/validate", type: :request do
  let(:url) { "/api/validate" }
  let!(:user) { create(:user) }

  context "when request has auth" do
    it "returns a success status" do
      get url, headers: auth_header(user), as: :json

      expect(response).to have_http_status(:success)
      expect(json).to include(message: "Yep, your token is still valid!")
    end
  end

  context "when request has no auth" do
    it "returns an unauthorized status" do
      get url, as: :json

      expect(response).to have_http_status(:unauthorized)
      expect(json).to include(error: "You need to sign in or sign up before continuing.")
    end
  end
end
