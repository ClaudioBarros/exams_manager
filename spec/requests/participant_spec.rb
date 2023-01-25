require 'rails_helper'

RSpec.describe Api::V1::ParticipantsController, type: :request do

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(
      :authenticate_request).and_return(true)

    allow_any_instance_of(ApplicationController).to receive(
      :require_admin).and_return(true)
  end

  describe "GET /api/v1/participants" do
    it "endpoint test" do 
      get api_v1_participants_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/participant/:id" do
    it "endpoint test" do 
      get api_v1_participant_path(id: 1)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /api/v1/participants" do
    it "endpoint test" do 
      post api_v1_participants_path(
        id: 1, 
        user_id: 25,
        exam_id: 5
      )
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/v1/participant/:id(.:params)" do
    it "endpoint test" do 
      put api_v1_participant_path(
        id: 1,
        user_id: 20,
        exam_id: 5
      )
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /api/v1/participant/:id" do
    it "endpoint test" do 
      participant = Participant.all.order('random()').first
      delete api_v1_participant_path(id: participant.id)
      expect(response).to have_http_status(200)
    end
  end


end
