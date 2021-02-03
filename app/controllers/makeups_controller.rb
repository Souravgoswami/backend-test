class MakeupsController < ApplicationController
  def index
    @makeups = Makeup.page(params[:page].to_i).per(20)
  end

  def show
    @makeup = Makeup.find(params[:id])
  end
end
