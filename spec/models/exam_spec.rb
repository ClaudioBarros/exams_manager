require 'rails_helper'

RSpec.describe Api::V1::ExamsController, type: :request do

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(
      :authenticate_request).and_return(true)

    allow_any_instance_of(ApplicationController).to receive(
      :require_admin).and_return(true)
  end

  describe "GET /api/v1/exams" do
    it "endpoint test" do 
      get api_v1_exams_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/exam/:id" do
    it "endpoint test" do 
      get api_v1_exam_path(id: 1)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /api/v1/exams" do
    it "endpoint test" do 
      post api_v1_exams_path(
        name: "Prova 3", 
        topic_id: 1
      )
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/v1/exam/:id(.:params)" do
    it "endpoint test" do 
      put api_v1_exam_path(
        id: 1,
        nome: "Prova 4",
      )
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /api/v1/exam/:id" do
    it "endpoint test" do 
      delete api_v1_exam_path(id: 1)
      expect(response).to have_http_status(200)
    end
  end
end
