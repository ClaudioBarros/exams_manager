module Api      
  module V1
    class UserAnswersController < ApplicationController

      #Listar todas as respostas de todos os candidatos por prova
      def index_by_exam
        if current_user.admin? 

          users_answers = UserAnswer.find_by(
            exam_id: params[:exam_id]
          )

          render json: {
            status: 'SUCCESS', 
            message:"#{users_answers} Respostas:", 
            data: format_exam_list(exams)
          },status: :ok
        else
          render json: { 
            error: 'Usuário não autorizado.' 
          },status: :unauthorized
        end
      end

      #Listar respostas por prova e participante
      def index_by_exam_and_user
        if (current_user.admin? or
            is_test_taker(current_user.id, params[:exam_id]))

          user_answers = UserAnswer.find_by(
            user_id: params[:user_id],
            exam_id: params[:exam_id]
          )

          render json: {
            status: 'SUCCESS', 
            message:"#{user_answers.size} Respostas:", 
            data: user_answers
          },status: :ok
        else
          render json: { 
            error: 'Usuário não autorizado.' 
          },status: :unauthorized
        end
      end
      
      # Salvar nova resposta
      # TODO: permitir criacao de varias respostas em uma unica requisicao
      def create
        if (current_user.admin? or 
            is_test_taker(current_user.id, params[:exam_id]))

          user_answer = UserAnswer.new(user_answer_params)
          if user_answer.save
            render json: {
              status: 'SUCCESS', 
              message:"Resposta:", 
              data: format_exam(exam)
            },status: :ok
          else
            render json: { 
              error: 'Erro ao salvar resposta.'
            },status: :unprocessable_entity
          end
        else
          render json: { 
            error: 'Usuário não autorizado.' 
          },status: :unauthorized
        end
      end

      #Atualizar uma resposta
      def update
        if (current_user.admin? or 
            is_test_taker(current_user.id, params[:exam_id]))

          user_answer = UserAnswer.find_by!(
            user_id: params[:user_id],
            exam_id: params[:exam_id]
          )

          if user_answer.update(user_answer_params)
            render json: {
              status:'SUCCESS', 
              message:'Resposta atualizada com sucesso',
              data: user_answer
            },status: :ok
          else
            render json: { 
              error: 'Erro ao atualizar resposta.'
            },status: :unprocessable_entity
          end
        else
          render json: { 
            error: 'Usuário não autorizado.' 
          },status: :unauthorized
        end
      end

      # Deletar uma resposta
      def delete
        if current_user.admin?
          user_answer = UserAnswer.find_by!(
            user_id: params[:user_id],
            exam_id: params[:exam_id],
            alternative_id:  params[:exam_id]
          ) 
          user_answer.destroy
          if user_answer.destroyed?
            render json: {
              status:'SUCCESS', 
              message:'Resposta deletada com sucesso',
              data: user_answer
            },status: :ok
          else
            render json: {
              error: 'Erro ao deletar resposta.',
            },status: :unprocessable_entity
          end
        else
          render json: { 
            error: 'Usuário não autorizado.' 
          },status: :unauthorized
        end
      end

      private
      def user_answer_params
        params.permit(
          :user_id,
          :exam_id,
          :alternative_id
        )
      end

      def is_test_taker(user_id, exam_id)
        exams = Participants.where(user_id: user_id, exam_id: exam_id)
        if exams.empty? 
          return false
        else
          return true
        end
      end

    end
  end
end
