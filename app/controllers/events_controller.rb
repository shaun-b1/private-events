class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.includes(:creator).all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:success] = "Great! Your event has been created!"
      redirect_to user_path(current_user[:id])
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:success] = "Great! Your event has been updated!"
      redirect_to user_path(current_user[:id])
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])

    if @event.destroy
      flash[:success] = "Your event has been deleted!"
      redirect_to user_path(current_user[:id])
    else
      flash.now[:error] = "Whoops! Something has gone wrong!"
      redirect_to user_path(current_user[:id])
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :event_time, :creator_id)
  end

end
