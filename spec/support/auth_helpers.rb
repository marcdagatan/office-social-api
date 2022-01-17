require "devise/jwt/test_helpers"

module AuthHelpers
  def auth_header(user, headers = {})
    Devise::JWT::TestHelpers.auth_headers(
      {
        Accept: "application/json",
        "Content-Type": "application/json"
      }.merge(headers),
      user
    )
  end
end
