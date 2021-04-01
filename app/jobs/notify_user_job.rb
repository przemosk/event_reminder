# frozen_string_literal: true

class NotifyUserJob
  include Sidekiq::Worker

  def perform(args)
    Alerts::Send.new(alert_id: args['alert_id'], user_id: args['user_id']).call
  end
end
