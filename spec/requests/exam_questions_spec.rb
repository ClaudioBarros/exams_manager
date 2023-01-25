require 'rails_helper'

RSpec.describe Api::V1::ExamQuestionsController, type: :request do

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(
      :authenticate_request).and_return(true)

    allow_any_instance_of(ApplicationController).to receive(
      :require_admin).and_return(true)
  end

  describe "GET /api/v1/exam_questions" do
    it "endpoint test" do 
      get api_v1_exam_questions_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/exam_questions/:id" do
    it "endpoint test" do 
      e = ExamQuestion.all.first
      get api_v1_exam_questions_show_path(
        eid: e.exam_id, 
        qid: e.question_id
      )
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /api/v1/exam_questions" do
    it "endpoint test" do 
      e = Exam.all.order('random()').first
      q = Question.all.order('random()').first
      post api_v1_exam_questions_path(
        exam_id: e.id, 
        question_id: q.id 
      )
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/v1/exam_questions/:id(.:params)" do
    it "endpoint test" do 
      e = ExamQuestion.all.order('random()').first
      put api_v1_exam_questions_update_path(
        eid: e.exam_id,
        qid: e.question_id,
        exam_id: 5,
        question_id: 10,
      )
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /api/v1/exam_questions/:id" do
    it "endpoint test" do 
      e = ExamQuestion.all.order('random()').first
      delete api_v1_exam_questions_destroy_path(qid: e.question_id, eid: e.exam_id)
      expect(response).to have_http_status(200)
    end
  end

end
