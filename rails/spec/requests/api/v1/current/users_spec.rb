require "rails_helper"

RSpec.describe "Api::V1::Current::Users", type: :request do
  describe "GET api/v1/current/user" do
    subject { get(api_v1_current_user_path, headers: headers) }

    let(:current_user) { create(:user) }
    let(:headers) { current_user.create_new_auth_token }

    context "with valid headers" do
      before { subject }

      it "returns the user's attributes" do
        res = JSON.parse(response.body)
        expect(res.keys).to contain_exactly("id", "name", "email")
      end

      it "returns a status of ok" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "with empty headers" do
      let(:headers) { {} }

      before { subject }

      it "returns an unauthorized error message" do
        res = JSON.parse(response.body)
        expect(res["errors"]).to eq ["ログインもしくはアカウント登録してください。"]
      end

      it "returns a status of unauthorized" do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
