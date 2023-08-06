class Api::V1::LearningResourcesController < ApplicationController
  def index
    country = params[:country]
    # resources = LearningFacade.new.get_resources(country)
    # video = VideoFacade.new.get_video(country)
    photos = PhotosFacade.new.get_photos(country)
  end
end