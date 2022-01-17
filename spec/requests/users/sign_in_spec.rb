require "rails_helper"

describe "POST /users/sign_in", type: :request do
  let(:email) { "john.wick@gmail.com" }
  let(:password) { "Password.12345" }
  let(:url) { "/users/sign_in" }
  let(:params) { { user: { email: email, password: password } } }
  let!(:user) { create(:user, email: email, password: password) }

  it "allows a user to sign in" do
    post url, params: params, as: :json

    expect(response).to have_http_status(:success)
    expect(response.header).to have_key("Authorization")
    expect(json[:user]).to include(email: email)
  end

  it "returns unauthorized with an error message if credentials is wrong" do
    params[:user][:password] = "this is the wrong password"

    post url, params: params, as: :json

    expect(response).to have_http_status(:unauthorized)
    expect(json[:error]).to eq "Invalid Email or password."
  end
end
