class CampersController < ApplicationController
    wrap_parameters format: false 
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_data 
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found  

    def index 
      render json: Camper.all, status: :ok 
    end 

    def show 
        camper = Camper.find(params[:id])
        render json: camper,serializer: CamperShowSerializer, status: :ok
    end 

    def create 
        render json: Camper.create!(camper_params), status: :created 
    end 

    private
    def camper_params
       params.permit(:name,:age)
    end 


    def invalid_data
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end 

    def record_not_found
        render json: {error: "Camper not found"}, status: :not_found 
    end 
end
