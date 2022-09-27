class ScientistsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response 
 rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

    def index
        render json: Scientist.all, status: :ok
    end 

    def show 
        render json: find_scientist, status: :ok
    end 

    def create 
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end 

    def update
        scientist = Scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    def destroy 
        scientist = find_scientist.destroy
        head :no_content
    end 

private 
    def find_scientist
        Scientist.find_by!(id: params[:id])
    end 

    def scientist_params 
        params.permit(:name, :field_of_study, :avatar)
    end 

    def record_not_found_response
        render json: {'error': "Scientist not found"}, status: :not_found
    end 

    def unprocessable_entity_response(exception)
        render json: {"errors": exception.record.errors.full_messages}, status: :unprocessable_entity
    end 


end
