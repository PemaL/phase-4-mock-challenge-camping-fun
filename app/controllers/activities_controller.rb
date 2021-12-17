class ActivitiesController < ApplicationController
    def index 
      render json: Activity.all, status: :ok 
    end 

    def destroy 
      activity = Activity.find_by(id: params[:id ])
      if activity.nil? 
        render json: {error: "Activity not found"}, status: :not_found
    else 
        activity.destroy
        render json: {}, status: :no_content
    end 
    end 

end
