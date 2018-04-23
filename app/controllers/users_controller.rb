class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @events = User.find(params[:id]).events
    @attended_events = @user.attended_events
  end
end
