class Authentication
  attr_accessor :status, :error, :_auth_key

  def initialize(attributes = {})
    @status = attributes[:status]
    @error = attributes[:error]
    @_auth_key = attributes[:auth_key]
  end

  def invalid?
    @error
  end

  def to_json(options = {})
    {:status => @status, :error => @error}
  end

  def auth_key
    @_auth_key
  end
end