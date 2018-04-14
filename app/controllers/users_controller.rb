class UsersController < ApplicationController
  def index
  end

  def show
    @events = User.find(params[:id]).events
  end
end
