require 'rails_helper'

describe Alerts::Create, type: :service do
  subject { described_class.new(event_id: event_id, user_id: user_id, remind_at: remind_at) }

  context 'create new alert' do
    let!(:event_id) { create(:event).id }
    let!(:user_id) { create(:user).id }
    let(:remind_at) { Time.parse(2.days.from_now.to_s) }

    it 'should change alerts count' do
      expect { subject.call }.to change(Alert, :count).by(1)
    end
  end

  context 'not create if missing params' do
    let!(:event_id) { nil }
    let!(:user_id) { nil }
    let(:remind_at) { Time.parse(2.days.from_now.to_s) }

    it 'not change db alerts cound' do
      expect { subject.call }.not_to change(Alert, :count)
    end
  end
end
