require "rails_helper"
require "shared_examples/auth_example"

describe "DELETE /posts/:id", type: :request do
  let(:user) { create(:user) }
  let!(:post) { create(:post, author: user) }
  let(:url) { api_post_path(post) }

  it_behaves_like "a request with auth" do
    before { delete url, as: :json }
  end

  context "when user is author of post" do
    it "allows a user to delete the post" do
      expect {
        delete url, headers: auth_header(user), as: :json
      }.to change(Post, :count).by(-1)

      expect(response).to have_http_status(:success)
    end
  end

  context "when user is not auth of post" do
    it "doesn't allow the user to delete the post" do
      user2 = create(:user)

      expect {
        delete url, headers: auth_header(user2), as: :json
      }.not_to change(Post, :count)

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
