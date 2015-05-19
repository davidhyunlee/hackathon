class PagesController < ApplicationController
  def index
    endpoint = "https://outdoor-data-api.herokuapp.com/api.json?api_key=4016165acc967a9800153c77a3528d83"
    if params[:location] && params[:location] != ''
      @geocode = Geocoder.coordinates(params[:location])
      @lat = @geocode[0]
      @lon = @geocode[1]
    end


    if params[:activity]
      if @lat && @lon
        @response = HTTParty.get(endpoint + "&q[activities_activity_type_name_cont]=#{params[:activity]}&lat=#{@lat}&lon=#{@lon}")
      else
        @response = HTTParty.get(endpoint + "&q[activities_activity_type_name_cont]=#{params[:activity]}")
      end
      @coordinates = []
      @response["places"].each do |place|
        @coordinates << [place["lat"],place["lon"]]
      end
    elsif params[:activity] == ''
      if @lat && @lon
        @response = HTTParty.get(endpoint + "&lat=#{@lat}&lon=#{@lon}")
      else
        @response = HTTParty.get(endpoint)
      end
      @coordinates = []
      @response["places"].each do |place|
        @coordinates << [place["lat"],place["lon"]]
      end
    end

  end
end
