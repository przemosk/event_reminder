require 'rails_helper'

describe Alerts::Schedule, type: :service do
  subject { described_class.new(alert_id: alert.id, user_id: user.id) }

  let!(:event) { create(:event) }
  let!(:user) { create(:user) }
  let!(:alert) { Alert.create(event_id: event.id, user_id: user.id, remaind_at: Time.parse(2.days.from_now.to_s)) }

  context 'service schedule reminder job' do
    it 'execute job' do
      expect(NotifyUserJob.jobs.size).to eq 0
      subject.call
      expect(NotifyUserJob.jobs.size).to eq 1
    end
  end
end
