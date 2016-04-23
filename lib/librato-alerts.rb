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
    get("alerts")[:alerts]
  end

  def enable(alert_id)
    put("alerts/#{alert_id}", active: true)
  end

  def disable(alert_id)
    put("alerts/#{alert_id}", active: false)
  end

  private

  def get(endpoint, parameters = {})
    request(endpoint, :get, parameters)
  end

  def put(endpoint, parameters = {})
    request(endpoint, :put, parameters)
  end

  def request(endpoint, method, parameters)
    options = {
      method: method,
      params: default_parameters.merge(parameters),
      auth_type: :basic,
      user: @user,
      password: @token,
      format: :json
    }

    request = Nestful::Request.new("#{API_HOST}/#{endpoint}", options)

    response = request.execute

    return if response.body.nil? || response.body.empty?

    JSON.parse(response.body, symbolize_names: true)
  end

  def default_parameters
    { version: DEFAULT_VERSION }
  end
end
