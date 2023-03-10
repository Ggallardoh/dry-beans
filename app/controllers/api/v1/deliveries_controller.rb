# frozen_string_literal: true

class Api::V1::DeliveriesController < ApplicationController

  before_action :set_trip, only: :create

  # Creates a new delivery
  #
  # @return [Delivery] created delivery.
  def create
    delivery = @trip.deliveries.new(delivery_params)
    return error(status: 422, title: 'Delivery no creado', detail: delivery.errors.messages) unless delivery.save

    json_string = DeliverySerializer.new(delivery)
    success(status: 201, payload: json_string)
  end

  private

  # Attributes of the delivery to be created.
  #
  # @return [Hash] delivery attributes
  def delivery_params
    params.require(:delivery).permit(:recipient, :address)
  end

  # Set trip by :id in URL params.
  #
  # @return [nil] sets the trip requested to a global variable with name @trip.
  def set_trip
    @trip = Trip.find_by_id(params[:trip_id])
    return error(status: 404, title: 'No encontrado', detail: 'No se ha encontrado el viaje con la id especificada') if @trip.nil?
  end
end
