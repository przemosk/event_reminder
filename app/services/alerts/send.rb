# frozen_string_literal: true

module Alerts
  class Send
    def initialize(alert_id:, user_id:)
      @alert_id = alert_id
      @user_id = user_id
    end

    def call
      handler = client.send_messages([message])

      alert.update(sent: true)
      # alert.update(sent: true) if handler.errors.empty?
    end

    private

    attr_reader :alert_id, :user_id

    def client
      @client ||= Exponent::Push::Client.new
    end

    def message
      {
        to: user.email,
        sound: 'default',
        title: 'Event Reminder',
        body: 'Your event starting soon',
        priority: 'default',
        badge: 0,
        channelId: 'game'
      }
    end

    def alert
      Alert.find(alert_id)
    end

    def user
      User.find_by(id: alert.user_id)
    end
  end
end
