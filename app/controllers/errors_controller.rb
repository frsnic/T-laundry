class ErrorsController < ApplicationController

  def error403
    render "error", status: :forbidden
  end

  def error404
    render "error", status: :not_found
  end

  def error422
    render "error", status: :unprocessable_entity
  end

  def error500
    render "error", status: :internal_server_error
  end

end
