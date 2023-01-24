module Api
  module V1
    class ParticipantController < ApplicationController
      before_action :require_admin
      
      #Listar todas as provas e questoes
      def index
        participants = Participant.order('exam_id DESC')
        render json: {
          status: 'SUCCESS', 
          message:"Participantes", 
          data: participants 
        },status: :ok
      end

      #Listar uma prova e suas questoes
      def show
        participant = Participant.find_by(params[:id])
        render json: {
          status: 'SUCCESS', 
          message:"Participante:", 
          data: participant
        },status: :ok
      end

      # Adicionar nova questao a prova
      def create
        begin 
          Participant.transaction do
            participant = Participants.create!(params)
          end
        rescue ActiveRecord::RecordInvalid => exception
          render json: { 
            error: 'Erro ao criar participante.',
          },status: :unprocessable_entity
          return
        end
        render json: {
          status:'SUCCESS', 
          message:'Participante criado com sucesso',
          data: participant
        },status: :ok
      end

      # Atualizar prova
      def update
        participant = Participant.find_by(
          participant_id: params[:exam_id], 
          question_id: params[:question_id], 
        )
        if participant.update(exam_params)
          render json: {
            status:'SUCCESS', 
            message:'Participante atualizado com sucesso',
            data: participant
          },status: :ok
        else
          render json: {
            error: 'Erro ao atualizar participante.',
          },status: :unprocessable_entity
          return
        end
      end

      # Deletar prova
      def delete
        participant = Participant.find_by(
          user_id: params[:exam_id], 
          question_id: params[:question_id], 
        )
        participant.destroy
        if participant.destroyed?
          render json: {
            status:'SUCCESS', 
            message:'Participante deletado com sucesso',
            data: participant
          },status: :ok
        else
          render json: {
            error: 'Erro ao deletar participante.',
          },status: :unprocessable_entity
        end
      end

      private
      def params
        params.permit(
          :exam_id, 
          :question_id
        ) 
      end
    end
  end
end
