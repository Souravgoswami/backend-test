class HomeController < ApplicationController
  def welcome
    @makeups = Makeup.page(params[:page].to_i).per(20)
  end
end
