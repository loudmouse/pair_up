class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @hosting = User.find(params[:id]).events
    @attended_events = @user.attended_events
    @upcoming_events = @user.upcoming_events
    @past_events = @user.past_events
  end
end
