class ApplicationController < ActionController::API
  include Response

# ----------------- GET REQUEST EXCEPTIONS -----------------
  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end


  # ----------------- POST REQUEST EXCEPTIONS -----------------
  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message }, :unprocessable_entity)
  end
  
end
