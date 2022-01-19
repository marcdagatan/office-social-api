require "rails_helper"

RSpec.shared_examples "a request with auth" do
  it "returns unauthorized if there is no auth" do
    expect(response).to have_http_status(:unauthorized)
  end
end
