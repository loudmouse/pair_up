class AttendancesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.attendees << current_user
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @event.attendees.delete(@user)
    redirect_to @event
  end


  private

      def logged_in_user
        unless logged_in?
          flash[:info] = "You must be logged in to do that."
          redirect_to login_path
        end
      end

      def correct_user_or_event_host
        unless correct_user || event_host
          flash[:warning] = "You are not authorized."
          redirect_to root_path
        end
      end

      def correct_user
        user = User.find(params[:user_id])
        current_user == user
      end

      def event_host
        host = Event.find(params[:event_id]).host
        current_user == host
      end

end
