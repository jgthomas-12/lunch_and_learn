class Api::V1::LearningResourcesController < ApplicationController
  def index
    country = params[:country]
    if country == ""
      render json: { error: "No learning resources available"}, status: :not_found
    else
      resource = LearningResourcesFacade.new.learning_resource(country)

      render json: LearningResourceSerializer.new(resource)
    end
  end
end