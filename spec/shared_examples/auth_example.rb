require "rails_helper"

RSpec.shared_examples "a request with auth" do
  it "returns unauthorized if there is no auth" do
    get url, as: :json

    expect(response).to have_http_status :unauthorized
  end
end
