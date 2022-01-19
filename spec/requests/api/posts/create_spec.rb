require "rails_helper"

describe "POST /api/posts", type: :request do
  let(:user) { create(:user) }
  let(:params) { { post: { body: "this is the body" } } }
  let(:url) { "/api/posts" }

  it "allows a user to create a post" do
    expect {
      post url, params: params, headers: auth_header(user), as: :json
    }.to change(Post, :count).by(+1)

    expect(response).to have_http_status(:success)
    expect(json).to include(body: params[:post][:body])
    expect(json[:author]).to include(email: user.email)
  end

  context "with errors" do
    it "returns a json with errors" do
      params[:post][:body] = ""

      post url, params: params, headers: auth_header(user), as: :json

      expect(response).to have_http_status(:unprocessable_entity)
      expect(json[:errors].present?).to eq true
    end
  end
end
