# frozen_string_literal: true

module Api
  class AlertsController < ApplicationController
    before_action :validate_params, only: [:add_alert]

    def add_alert
      result = Alerts::Create.new(
        event_id: alert_params[:event_id],
        user_id: alert_params[:user_id],
        remind_at: alert_params[:remaind_at]
      ).call

      Alerts::Schedule.new(alert_id: result.id, user_id: alert_params[:user_id]).call

      render json: { data: result.remaind_at }, status: 201
    end

    private

    def validate_params
      result = AlertValidator.new.call(alert_params.to_hash)
      render json: { data: { errors: result.errors.to_h } }, status: 422 unless result.success?
    end

    def alert_params
      params.permit(:event_id, :remaind_at, :user_id)
    end
  end
end
