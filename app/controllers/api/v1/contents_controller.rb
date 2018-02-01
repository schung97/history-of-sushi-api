class Api::V1::ContentsController < ApplicationController

  def index
    render json: Content.all
  end

end
