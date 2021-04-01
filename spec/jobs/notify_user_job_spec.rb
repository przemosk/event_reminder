require 'rails_helper'

describe NotifyUserJob, type: :job do

  let!(:event) { create(:event) }
  let!(:user) { create(:user) }
  let!(:alert) { Alert.create(event_id: event.id, user_id: user.id, remaind_at: Time.parse(2.days.from_now.to_s)) }

  let!(:scheduled_job) { described_class.perform_at(alert.remaind_at, { event_id: event.id, user_id: user.id }) }

  context 'schedule job' do
    it 'job is scheduled' do
      expect(described_class.jobs.last['jid'].include?(scheduled_job)).to eq true
      expect(described_class).to have_enqueued_sidekiq_job({ event_id: event.id, user_id: user.id })
    end
  end
end
