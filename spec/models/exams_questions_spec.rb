require 'rails_helper'

RSpec.describe Api::V1::ExamsQuestionsController, type: :model do

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(
      :authenticate_request).and_return(true)

    allow_any_instance_of(ApplicationController).to receive(
      :require_admin).and_return(true)
  end

  describe "GET /api/v1/exams_questionss" do
    it "endpoint test" do 
      get api_v1_exams_questionss_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/exams_questionss/:id" do
    it "endpoint test" do 
      get api_v1_exams_questionss_path(id: 1)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /api/v1/exams_questionss" do
    it "endpoint test" do 
      post api_v1_exams_questionss_path(
        exam_id: 1, 
        question_id: 1
      )
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/v1/exams_questions/:id(.:params)" do
    it "endpoint test" do 
      put api_v1_exams_questions_path(
        id: 1,
        exam_id: 1,
        question_id: 2,
      )
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /api/v1/exams_questions/:id" do
    it "endpoint test" do 
      delete api_v1_exams_questions_path(id: 1)
      expect(response).to have_http_status(200)
    end
  end

end
