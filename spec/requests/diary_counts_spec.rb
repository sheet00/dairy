require 'rails_helper'

RSpec.describe "DiaryCounts", :type => :request do
  describe "GET /diary_counts" do
    it "works! (now write some real specs)" do
      get diary_counts_path
      expect(response).to have_http_status(200)
    end
  end
end
