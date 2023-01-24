module Api      
  module V1
    class ExamsController < ApplicationController
      
      before_action :require_admin, only: [:create, :update, :delete]

      #Listar todas as provas
      def index
        if current_user.admin? do
          exams = Exam.order('created_at DESC')
          data_output = format_exam_list(exams)
        else
          exams = UserAnswers.select("exam_id").where(
            "user_id = ?", current_user.id
          )

          data_output = exams.map do |e|
            {format_exam(Exams.find(:id))}
          end
        end


        render json: {
          status: 'SUCCESS', 
          message:"#{exams.size} Provas:", 
          data: data_output 
        },status: :ok
      end
      end

      # Mostrar uma prova
      #TODO: exibir a prova com as questoes 
      def show
        if current_user.admin? or 
            is_test_taker() do

          exam = Exam.find(params[:id])
          render json: {
            status: 'SUCCESS', 
            message:"Prova", 
            data: format_exam(exam)
          },status: :ok
        else
          render json: {
            status: 'SUCCESS', 
            message:"Prova", 
            data: format_exam(exam)
          },status: :unauthorized

        end
      end

      # Criar nova prova
      def create
        begin 
          Exam.transaction do
            @exam = Exam.create!(exam_params)
          end
        rescue ActiveRecord::RecordInvalid => exception
          render json: 
            { error: 'Erro ao criar prova.',
              message: exception}, 
            status: :unprocessable_entity
          return
        end
        render json: {
          status:'SUCCESS', 
          message:'Questão criada com sucesso',
          data: format_exam(@exam)
        },status: :ok
      end

      # Atualizar prova
      def update
        exam = Exam.find(params[:id])
        if exam.update(exam_params)
          render json: {
            status:'SUCCESS', 
            message:'Prova atualizada com sucesso',
            data: exam
          },status: :ok
        else
          render json: {
            error: 'Erro ao atualizar prova.',
          },status: :unprocessable_entity
          return
        end
      end

      # Deletar prova
      def delete
        exam = Exam.find(params[:id]) 
        exam.destroy
        if exam.destroyed?
          render json: {
            status:'SUCCESS', 
            message:'Prova deletada com sucesso',
            data: exam
          },status: :ok
        else
          render json: {
            error: 'Erro ao deletar prova.',
          },status: :unprocessable_entity
        end
      end

      private
      def exam_params
        params.permit(
          :name, 
          :topic_id, 
          questions_attributes: [:id]
        ) 
      end

      def format_exam(exam)
        return {
          :id => exam.id, :name => exam.name, 
          :created_at => exam.created_at,
          :updated_at => exam.updated_at,
          :questions => ExamsQuestions.select("question_id").where("exam_id = ?", exam.id)
        }
      end
      
      def format_exam_list(exams)
        exam_list = exams.map do |e|
          {format_exam(e)}
        end
        return exam_list
      end

      def is_test_taker(user_id, exam_id)
        exams = Participants.find_by(user_id: user_id, exam_id: exam_id)
        if exams.empty? 
          return false
        else
          return true
        end
      end
    end
  end
end
end
end
