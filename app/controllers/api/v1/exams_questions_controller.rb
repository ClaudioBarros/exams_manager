module Api
  module V1
    class ExamsQuestionsController < ApplicationController

      before_action :require_admin
      
      #Listar todas as provas e questoes
      def index
        exams = ExamsQuestions.order('exam_id DESC')
        render json: {
          status: 'SUCCESS', 
          message:"Provas-Questões:", 
          data: exams 
        },status: :ok
      end

      #Listar uma prova e suas questoes
      def show
        exam = ExamsQuestions.find_by(
          exam_id: params[:exam_id], 
          question_id: params[:question_id], 
        )
        render json: {
          status: 'SUCCESS', 
          message:"Prova-Questões:", 
          data: exam
        },status: :ok
      end

      # Adicionar nova questao a prova
      def create
        begin 
          ExamsQuestions.transaction do
            exam_question = ExamsQuestions.create!(params)
          end
        rescue ActiveRecord::RecordInvalid => exception
          render json: 
            { error: 'Erro ao associar questão à prova.',
              message: exception}, 
            status: :unprocessable_entity
          return
        end
        render json: {
          status:'SUCCESS', 
          message:'Questão criada com sucesso',
          data: exam_question
        },status: :ok
      end

      # Atualizar prova
      def update
        exam_question = ExamsQuestions.find_by(
          exam_id: params[:exam_id], 
          question_id: params[:question_id], 
        )
        if exam_question.update(exam_params)
          render json: {
            status:'SUCCESS', 
            message:'Prova atualizada com sucesso',
            data: exam
          },status: :ok
        else
          render json: {
            error: 'Erro ao atualizar associação <Prova-Questão>.',
          },status: :unprocessable_entity
          return
        end
      end

      # Deletar prova
      def delete
        exam_question = ExamsQuestions.find_by(
          exam_id: params[:exam_id], 
          question_id: params[:question_id], 
        )
        exam.destroy
        if exam.destroyed?
          render json: {
            status:'SUCCESS', 
            message:'Associação <Prova-Questão> deletada com sucesso',
            data: exam
          },status: :ok
        else
          render json: {
            error: 'Erro ao deletar associação <Prova-Questão>.',
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


