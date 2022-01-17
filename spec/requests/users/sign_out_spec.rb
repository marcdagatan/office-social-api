require "rails_helper"

describe "DELETE users/sign_out", type: :request do
  let(:url) { "/users/sign_out" }
  let!(:user) { create(:user) }

  it "allows the user to sign out from the api" do
    delete url, headers: auth_header(user)

    expect(response).to have_http_status(:ok)
    expect(json).to include(message: "You are logged out.")
  end
end
