class Api::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token

  protected

  def render_errors(status = 418, errors)
    render(
      {
        status: status,
        json: {errors: errors}
      }
    )
  end

  def render_response(status = 200, data)
    render(
      {
        status: status,
        json: data
      }
    )
  end
end
