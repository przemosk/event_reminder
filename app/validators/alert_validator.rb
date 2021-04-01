# frozen_string_literal: true

class AlertValidator < Dry::Validation::Contract
  params do
    required(:event_id).filled(:integer)
    required(:remaind_at).filled(:string)
    required(:user_id).filled(:integer)
  end


  rule(:event_id) do
    key.failure("can't find event") unless event(id: value.to_i).present?
  end

  rule(:user_id) do
    key.failure("can't find user") unless User.find_by(id: value.to_i).present?
  end

  rule(:remaind_at, :event_id) do
    key.failure("can't add alert to past event") if Time.parse(values[:remaind_at]) > Time.parse(event(id: values[:event_id]).start_date.to_s)
  end

  def event(id:)
    @event ||= Event.find_by(id: id.to_i)
  end
end
