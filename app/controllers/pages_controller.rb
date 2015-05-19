class PagesController < ApplicationController
  def index
  	url = "https://maps.googleapis.com/maps/api/js?key="
  	key = ENV['GOOGLE_MAPS']
  	@endpoint = "https://maps.googleapis.com/maps/api/js?key=AIzaSyD-nlhAjczDjrWflhOm8edXLfliwPvbjnE"
  end
end
