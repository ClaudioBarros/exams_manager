module Api
  module V1
    class ExamQuestionsController < ApplicationController

      before_action :require_admin
      
      #Listar todas as provas e questoes
      def index
        exams = ExamQuestion.order('exam_id DESC')
        render json: {
          status: 'SUCCESS', 
          message:"Provas-Questões:", 
          data: exams 
        },status: :ok
      end

      #Listar uma prova e suas questoes
      def show
        e = ExamQuestion.find_by(
          exam_id: params[:eid],
          question_id: params[:qid])
        render json: {
          status: 'SUCCESS', 
          message:"Prova-Questões:", 
          data: e
        },status: :ok
      end

      # Adicionar nova questao a prova
      def create
        begin 
          ExamQuestion.transaction do
            @exam_question = ExamQuestion.create!(check_params)
          end
        rescue ActiveRecord::RecordInvalid => exception
          render json: { 
            error: 'Erro ao associar questão à prova.',
            message: exception
          },status: :unprocessable_entity
          return
        end
        render json: {
          status:'SUCCESS', 
          message:'Questão criada com sucesso',
          data: @exam_question
        },status: :ok
      end

      #Atualizar associação 
      def update 
        begin 
          ExamQuestion.transaction do 
            @e = ExamQuestion.find_by(
              exam_id: params[:eid],
              question_id: params[:qid]
            )
            puts(params)
            puts(@e.attributes)
            @e.update(check_params)
          end
        rescue ActiveRecord::RecordInvalid => exception
          render json: {
            error: 'Erro ao atualizar associação <Prova-Questão>.'
          },status: :unprocessable_entity
          return
        end
        render json: {
          status:'SUCCESS', 
          message:'Associação <Prova-Questão> atualizada com sucesso',
          data: @e
        },status: :ok
      end

=begin
      # Atualizar prova
      def update
        e = ExamQuestion.find_by(
          exam_id: params[:eid], 
          question_id: params[:qid]
        )
        if e.update!(check_params)
          render json: {
            status:'SUCCESS', 
            message:'Prova atualizada com sucesso',
            data: e
          },status: :ok
        else
          render json: {
            error: 'Erro ao atualizar associação <Prova-Questão>.',
          },status: :unprocessable_entity
          return
        end
      end
=end

      # Deletar prova
      def destroy 
        begin
          ExamQuestion.transaction do
            e = ExamQuestion.find_by(
              exam_id: params[:eid],
              question_id: params[:qid]
            )
            e.delete
          end
        rescue ActiveRecord::RecordInvalid => exception
          render json: {
            error: 'Erro ao deletar associação <Prova-Questão>.',
          },status: :unprocessable_entity
          return
        end
          render json: {
            status:'SUCCESS', 
            message:'Associação <Prova-Questão> deletada com sucesso',
          },status: :ok
      end

      private
      def check_params
        params.permit(:exam_id, :question_id) 
      end

    end

  end
end

