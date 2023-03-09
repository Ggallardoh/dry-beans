class ApplicationController < ActionController::API
  # Returns a successful response
  #
  # @return [Response] successful response with object and status.
  def success(status: nil, payload: {})
    render json: payload, status: status || 200
  end

  # Creates an error object with basic information according to JSON:API.
  #
  # @return [Hash] a hash that contains information about one error.
  def create_error(status: nil, title: nil, detail: nil)
    {
      status: status || 400,
      title: title || 'Bad request',
      detail: detail || 'Bad request'
    }
  end

  # Returns a failed response with one single error.
  #
  # @return [Response] a failure response with an array that contains one error. The array is used because of the JSON:API specification.
  def error(status: nil, title: nil, detail: nil)
    error = create_error(status: status, title: title, detail: detail)
    render json: { 'errors': [error] }, status: status
  end
end
