require 'rails_helper'

RSpec.describe "Urls", type: :request do
  describe "POST /encode" do
    let(:original_url) { "https://www.youtube.com/watch?v=EkDN7TqOG2c" }
    let(:params) do
      {
        url: original_url,
      }
    end

    before { post encode_urls_path, params: params, as: :json }

    it "should reponse shortened url" do
      code = Url.last.code
      expect(JSON.parse(response.body)["shortened_url"]).to eq "#{ENV["HOSTNAME"]}/#{code}"
    end
  end

  describe "GET #decode" do
    context "when URL is found" do
      let!(:url) { create(:url) }

      it "redirects to the original URL" do
        get "/#{url.code}"
        expect(response).to redirect_to(url.original_url)
      end
    end

    context "when URL is not found" do
      it "return not found" do
        get "/invalid_code"
        expect(response.body).to include("Not Found URL")
      end
    end
  end
end
