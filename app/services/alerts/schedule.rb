# frozen_string_literal: true

module Alerts
  class Schedule
    def initialize(alert_id:, user_id:)
      @alert_id = alert_id
      @user_id = user_id
    end

    def call
      NotifyUserJob.perform_at(alert.remaind_at, { alert_id: alert_id, user_id: user_id })
    end

    private

    attr_reader :alert_id, :user_id

    def alert
      Alert.find(alert_id)
    end
  end
end
