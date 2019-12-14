module Response
  def success_response(object, status = :ok)
    render json: object, status: status
  end

  def error_response(msg)
    render json: {status: "error", message: msg}
  end
end
