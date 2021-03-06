require "rails_helper"
require "shared_examples/auth_example"

describe "GET /api/posts" do
  let(:url) { "/api/posts" }
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 40) }

  it_behaves_like "a request with auth" do
    before { get url, as: :json }
  end

  it "returns an array of posts" do
    get url, headers: auth_header(user)

    expect(response).to have_http_status :success
    expect(json[:posts].count).to eq 30
  end
end
