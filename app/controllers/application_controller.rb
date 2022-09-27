class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response 
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

private
    def record_not_found_response
        render json: {'error': "Not found"}, status: :not_found
    end 

    def unprocessable_entity_response(exception)
        render json: {"errors": exception.record.errors.full_messages}, status: :unprocessable_entity
    end 
end
