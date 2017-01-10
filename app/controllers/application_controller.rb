class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_unprocessable_entity_response(exception)
    render_error(exception.record.errors, :unprocessable_entity)
  end

  def render_not_found_response(exception)
    render_error({error: exception.message}, :not_found)
  end

  def render_error(resource, status)
    render json: resource, status: status
  end
end
