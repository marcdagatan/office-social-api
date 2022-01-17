module JsonHelpers
  def json
    @json || JSON.parse(response.body).deep_symbolize_keys
  end
end
