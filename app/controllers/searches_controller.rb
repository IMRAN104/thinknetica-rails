class SearchesController < ApplicationController
  before_action :set_stations

  def show
  end

  def result
    @station_from = RailwayStation.find(params[:station_from])
    @station_to = RailwayStation.find(params[:station_to])
    redirect_to :search if @station_from == @station_to
    
    @trains = Train.find_suitable_train(@station_from.id, @station_to.id)
  end

  private

  def set_stations
    @railway_stations = RailwayStation.all
  end
end
