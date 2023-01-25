require 'rails_helper'

RSpec.describe Api::V1::AlternativesController, type: :request do

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(
      :authenticate_request).and_return(true)

    allow_any_instance_of(ApplicationController).to receive(
      :require_admin).and_return(true)
  end

  describe "GET /api/v1/alternatives" do
    it "endpoint test" do 
      get api_v1_alternatives_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/alternative/:id" do
    it "endpoint test" do 
      get api_v1_alternatives_path(id: 1)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /api/v1/alternatives" do
    it "endpoint test" do 
      a0 = [{question_id: 1, statement: "2", value: true}]
      post api_v1_alternatives_path(
        alternatives: a0)
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/v1/alternative/:id(.:params)" do
    it "endpoint test" do 
      put api_v1_alternative_path(
        id: 1,
        statement: '2735938',
        value: false
      )
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /api/v1/alternative/:id" do
    it "endpoint test" do 
      delete api_v1_alternative_path(id: 1)
      expect(response).to have_http_status(200)
    end
  end
end
