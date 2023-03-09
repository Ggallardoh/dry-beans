# frozen_string_literal: true

class Api::V1::RoutesController < ApplicationController

  before_action :set_route, only: :show

  # Gets one route requested by :id in URL params.
  #
  # @return [Route] requested route.
  def show
    json_string = RouteSerializer.new(@route, {include: [:'trips.pickups', :'trips.deliveries']})
    success(status: 200, payload: json_string)
  end

  private

  # Set route by :id in URL params.
  #
  # @return [nil] sets the route requested to a global variable with name @route.
  def set_route
    @route = Route.find_by_id(params[:id])
    return error(status: 404, title: 'No encontrado', detail: 'No se ha encontrado la ruta con la id especificada') if @route.nil?
  end
end
