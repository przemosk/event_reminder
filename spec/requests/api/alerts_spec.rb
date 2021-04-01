require 'rails_helper'

RSpec.describe Api::AlertsController, type: :request do
  let!(:user) { create(:user) }
  let!(:event) { create(:event) }

  let(:valid_attributes) { { event_id: event.id, user_id: user.id, remaind_at: Time.parse(2.days.from_now.to_s) } }
  let(:invalid_attributes) { { event_id: nil, user_id: nil, remaind_at: nil } }

  describe 'POST /add_alert' do
    context 'with valid parameters' do
      it 'creates a new Alert' do
        expect { post add_alert_api_alerts_url, params: valid_attributes, as: :json }.to change(Alert, :count).by(1)
      end

      it 'renders a JSON response with the new alert' do
        post add_alert_api_alerts_url,
             params: valid_attributes, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Alert' do
        expect { post add_alert_api_alerts_url, params: invalid_attributes, as: :json }.to change(Alert, :count).by(0)
      end

      it 'renders a JSON response with errors for the new alert' do
        post add_alert_api_alerts_url, params: invalid_attributes, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'add alert to past event' do
      let!(:event) { create(:event, start_date: Time.parse(2.weeks.ago.to_s)) }

      it "does not create a new Alert" do
        expect { post add_alert_api_alerts_url, params: invalid_attributes, as: :json }.to change(Alert, :count).by(0)
      end
    end
  end
end
