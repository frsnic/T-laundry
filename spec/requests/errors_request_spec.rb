require 'rails_helper'

RSpec.describe "Errors Request", type: :request do

  describe "visit #error403" do
    it "returns http forbidden (403)" do
      visit "/403"
      expect(page.status_code).to eq(403)
      expect(page).to have_content("Forbidden ...")
    end
  end

  describe "visit #error404" do
    it "returns http not_found (404)" do
      visit "/404"
      expect(page.status_code).to eq(404)
      expect(page).to have_content("Not Found ...")
    end
  end

  describe "visit #error422" do
    it "returns http unprocessable_entity (422)" do
      visit "/422"
      expect(page.status_code).to eq(422)
      expect(page).to have_content("Unprocessable Entity ...")
    end
  end

  describe "visit #error500" do
    it "returns http internal_server_error (500)" do
      visit "/500"
      expect(page.status_code).to eq(500)
      expect(page).to have_content("Internal Server Error ...")
    end
  end

end
