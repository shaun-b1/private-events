class EventAttendingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      flash.now[:already_attending] = "You're already attending this event!"
      redirect_to @event
    else
      @event.attendees << current_user
      flash[:attending] = "You're all signed up!"
      redirect_to @event
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      @event.attendees.destroy(current_user)
      flash[:success] = "You're no longer attending this event"
      redirect_to @event
    else
      flash.now[:error] = "Something went wrong!"
      redirect_to @event
    end
  end
end
