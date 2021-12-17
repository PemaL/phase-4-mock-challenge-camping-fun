class SignupsController < ApplicationController
    wrap_parameters format: false 
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_data 

    def create 
        Signup.create!(signup_params)  
        render json:Activity.find(params[:activity_id]),status: :created 
    end 

    private 

    def signup_params
     params.permit(:time,:camper_id,:activity_id)
    end 

    def invalid_data
      render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end 
end
