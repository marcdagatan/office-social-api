require "rails_helper"
require "shared_examples/auth_example"

describe "PATCH /api/posts/:id", type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }
  let(:url) { api_post_path(post) }
  let(:params) { { post: { body: "I updated the post" } } }

  it_behaves_like "a request with auth" do
    before { patch url, params: params, as: :json }
  end

  context "when user is author" do
    it "allows the user to update a post" do
      patch url, params: params, headers: auth_header(user), as: :json

      expect(response).to have_http_status(:success)
      expect(json).to include(body: params[:post][:body])
    end
  end

  context "when user is not author" do
    it "doesn't allow the user to update the post" do
      user2 = create(:user)

      patch url, params: params, headers: auth_header(user2), as: :json

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
