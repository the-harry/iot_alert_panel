# frozen_string_literal: true

class Api::V1::DevicesController < ActionController::API
  before_action :find_device, only: [:search, :alert]
  before_action :device_valid?, only: [:search, :alert]

  def search
    render json: { name: @device.name, cel: @device.cel }, status: :ok
  end

  def alert
    if @device.send_alert
      render json: {}, status: :ok
    else
      render json: {}, status: :service_unavailable
    end
  end

  private

  def find_device
    @device = Device.find_by(mac: params[:mac])
  end

  def device_valid?
    return render json: 'not_found', status: :not_found if @device.blank?
  end
end
