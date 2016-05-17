require "nestful"

module LibratoAlerts
  extend self

  API_HOST = "https://metrics-api.librato.com/v1"
  DEFAULT_VERSION = 2

  attr_writer :user, :token

  def configure
    yield self
  end

  def all
    request(method: :get)[:alerts]
  end

  def enable(alert_id)
    request(
      endpoint: "/#{alert_id}",
      method: :put,
      active: true)
  end

  def disable(alert_id)
    request(
      endpoint: "/#{alert_id}",
      method: :put,
      active: false)
  end

  def delete(alert_id)
    request(
      endpoint: "/#{alert_id}",
      method: :delete)
  end

  private

  def request(endpoint: "", method:, **parameters)
    options = {
      method: method,
      params: default_parameters.merge(parameters),
      auth_type: :basic,
      user: @user,
      password: @token,
      format: :json
    }

    response = Nestful::Request.new("#{API_HOST}/alerts#{endpoint}", options).execute

    return if response.body.nil? || response.body.empty?

    JSON.parse(response.body, symbolize_names: true)
  end

  def default_parameters
    { version: DEFAULT_VERSION }
  end
end
