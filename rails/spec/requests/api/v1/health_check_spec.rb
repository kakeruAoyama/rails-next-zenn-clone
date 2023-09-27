require "rails_helper"

RSpec.describe "Api::V1::HealthCheck" do
  describe "GET api/v1/health_check" do
    subject { get(api_v1_health_check_path) }

    before { subject }

    describe "response body" do
      let(:parsed_response) { response.parsed_body }

      it "returns a success message" do
        expect(parsed_response["message"]).to eq "Success Health Check!"
      end
    end

    describe "response status" do
      it "returns a success status" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
