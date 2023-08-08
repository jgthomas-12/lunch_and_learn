class Api::V1::AirQualityController < ApplicationController
  def index
    country = params[:country]
    air_quality = AirQualityFacade.new.air_quality(country)
    render json: AirQualitySerializer.new(air_quality)
  end

  # def index
  #   if params[:country] == ""
  #     country = CountriesFacade.new.get_country
  #     air_quality = AirQualityFacade.new.air_quality(country)

  #     render json: AirQualitySerializer.new(air_quality)
  #   else
  #     country = params[:country]
  #     air_quality = AirQualityFacade.new.air_quality(country)

  #     render json: AirQualitySerializer.new(air_quality)
  #   end
  # end
end