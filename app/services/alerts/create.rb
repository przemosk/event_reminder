module Alerts
  class Create
    def initialize(event_id:, user_id:, remind_at:)
      @event_id = event_id
      @user_id = user_id
      @remind_at = remind_at
    end

    def call
      return if (event_id || user_id).nil?

      Alert.create(
        user_id: user_id,
        event_id: event_id,
        remaind_at: calculate_remind_date
      )
    end

    private

    attr_reader :event_id, :user_id, :remind_at

    def calculate_remind_date
      Time.parse(remind_at.to_s)
    end
  end
end
