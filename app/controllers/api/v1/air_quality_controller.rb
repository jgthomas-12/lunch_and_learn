class Api::V1::AirQualityController < ApplicationController
  def index
    country = params[:country]
    air_quality = AirQualityFacade.new.air_quality(country)
    render json: AirQualitySerializer.new(air_quality)
  end
end