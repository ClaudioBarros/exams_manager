module Api      
  module V1
    class QuestionsController < ApplicationController

      before_action :require_admin

      # Listar todas as questões
      def index
        questions = Question.order('created_at DESC')
        
        render json: {
          status: 'SUCCESS', 
          message:"#{questions.size} Questão(s):", 
          data: format_question_list(questions)
        },status: :ok
      end

      # Exibir uma questão
      def show
        question = Question.find(params[:id])
        render json: {
          status: 'SUCCESS', 
          message:"Questão:", 
          data: question
        },status: :ok
      end

      # Criar questão
      def create
        begin
          Question.transaction do
            @question = Question.create!(question_params)
          end
        rescue ActiveRecord::RecordInvalid => exception
          render json: { 
            error: 'Erro ao criar questão.',
          },status: :unprocessable_entity
          return
        end
        render json: {
          status:'SUCCESS', 
          message:'Questão criada com sucesso',
          data: format_question(@question)
        },status: :ok
      end

      # Atualizar uma questão
      def update
        question = Question.find(params[:id])
        if question.update(question_params)
          render json: {
            status:'SUCCESS', 
            message:'Questão atualizada com sucesso',
            data: question
          },status: :ok
        else
          render json: { 
            error: 'Erro ao atualizar questão.' 
          },status: :unprocessable_entity
        end
      end

      # Deletar uma questão
      def destroy
        question = Question.find(params[:id])
        question.destroy
        render json: {
          status: 'SUCCESS', 
          message:'Questão excluída com sucesso'
        },status: :ok
      end

      private
      def question_params
        params.permit(
          :statement, 
          :topic_id, 
          alternatives_attributes: [
            :statement, :value
          ])
      end

      def format_question_list(questions)
        questionlist = questions.map do |q|
          { :id => q.id, :statement => q.statement, 
            :created_at => q.created_at, :updated_at => q.updated_at, 
            :alternatives => Alternative.where("question_id = ?", q.id)}
        end
        return questionlist
      end

      def format_question(question)
        return {
          :id => question.id, 
          :statement => question.statement, 
          :created_at => question.created_at, 
          :updated_at => question.updated_at, 
          :alternatives => Alternative.where("question_id = ?", question.id)
        }
      end

    end
  end
end
