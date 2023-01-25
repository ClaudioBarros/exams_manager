require 'rails_helper'

RSpec.describe Api::V1::UserAnswersController, type: :request do

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(
      :authenticate_request).and_return(true)

    allow_any_instance_of(ApplicationController).to receive(
      :require_admin).and_return(true)

    allow_any_instance_of(ApplicationController).to receive(
      :current_user).and_return(User.all.first)
    
    @test_user = User.all.first

  end

  describe "GET /api/v1/user_answers/" do
    it "endpoint test" do 
      get api_v1_user_answers_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/user_answers/:eid" do
    it "endpoint test" do 
      get api_v1_user_answers_path(@test_user.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /api/v1/user_answers" do
    it "endpoint test" do 
      post api_v1_user_answers_path(
        user_id: 1,
        exam_id: 1,
        alternative_id: 1,
      )
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/v1/user_answer/:id(.:params)" do
    it "endpoint test" do 
      put api_v1_user_answer_path(
        id: 1,
        user_id: 1,
        exam_id: 1,
        alternative_id: 2,
      )
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /api/v1/user_answer/:id" do
    it "endpoint test" do 
      delete api_v1_user_answer_path(id: 1)
      expect(response).to have_http_status(200)
    end
  end

end
