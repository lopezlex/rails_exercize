class RegistrationsController < ApplicationController
  before_action :require_signin
  before_action :set_event

  def index
    @registrations = @event.registrations
    # @registrations = Registration.all
  end

  def new
    @registration = @event.registrations.new
  end

  def create
    @registration = @event.registrations.new(registration_params)
    @registration.user = current_user

    if @registration.save
      redirect_to event_registrations_url(@event), notice: "Thanks for registering!"
    else
      render :new
    end
  end

private

  # def registration_params
  #   params.require(:registration).permit(:name, :email, :how_heard)
  # end

  def registration_params
    params.require(:registration).permit(:how_heard)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

end
