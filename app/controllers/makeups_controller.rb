class MakeupsController < ApplicationController
  def index
    uri = URI.parse("http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline")
    resp = Net::HTTP.get(uri)
    @makeups = JSON.parse(resp)
  end

  def show
    @makeup = Makeup.find(params[:id])
  end
end
