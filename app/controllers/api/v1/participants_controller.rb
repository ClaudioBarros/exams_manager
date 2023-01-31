module Api
  module V1
    class ParticipantsController < ApplicationController
      before_action :require_admin
      
      #Listar todos os participantes 
      def index
        participants = Participant.order('exam_id DESC')
        render json: {
          status: 'SUCCESS', 
          message:"Participantes", 
          data: participants 
        },status: :ok
      end

      #Listar todos os participantes por prova, ordenados por nota
      def index_by_exam_and_grade
        participants = Participant.where(
          exam_id: params[:eid]
        ).order('grade DESC')
        render json: {
          status: 'SUCCESS', 
          message:"Participantes", 
          data: participants 
        },status: :ok
      end

      #Listar um participante
      def show
        participant = Participant.find_by(params[:id])
        render json: {
          status: 'SUCCESS', 
          message:"Participante:", 
          data: participant
        },status: :ok
      end

      # Adicionar novo participante
      def create
        begin 
          Participant.transaction do
            @participant = Participant.create!(participant_params)
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
          data: @participant
        },status: :ok
      end

      # Atualizar prova
      def update
        participant = Participant.find_by(id: params[:id])
        if participant.update(participant_params)
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
      def destroy
        participant = Participant.find_by(params[:id])
        participant.destroy
        if participant.destroyed?
          render json: {
            status:'SUCCESS', 
            message:'Participante deletado com sucesso'
          },status: :ok
        else
          render json: {
            error: 'Erro ao deletar participante.',
          },status: :unprocessable_entity
        end
      end

      private

      def participant_params
        params.permit(
          :user_id, 
          :exam_id
        ) 
      end
      
      def calc_grade(p) #=> participant
        num_questions = ExamQuestion.where(exam_id: p.exam_id).count

        answers = UserAnswer.where(user_id: p.user_id, exam_id: p.exam_id)
        
        num_correct_questions = 0
        answers.each do |a|
          alt = Alternative.where(id: a.alternative_id)  
          if(alt.value == true) 
            num_correct_question += 1    
          end
        end

        g = num_correct_questions/num_questions

        p.update(grade: g)
        
      end

    end
  end
end
