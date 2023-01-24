module Api      
  module V1
    class TopicsController < ApplicationController
      # Listar todas as matérias
      def index
        if current_user.admin?
          topics = Topic.order('created_at DESC');
          render json: {status: 'SUCCESS', message:"#{topics.size} Matéria(s):", data:topics}, status: :ok
        else
          render json: { error: 'Usuário não autorizado' }, status: :unauthorized
        end
      end
      
      # Exibir uma matéria
      def show
        if current_user.admin?
          topic = Topic.find(params[:id])
          render json: {status:'SUCCESS', message:'Matéria:', data:topic}, status: :ok
        else
          render json: { error: 'Usuário não autorizado' }, status: :unauthorized
        end
      end

      # Criar nova matéria
      def create
        if current_user.admin?
          topic = Topic.new(topic_params)
          if topic.save
            render json: {status:'SUCCESS', message:'Matéria criada com sucesso', data:topic}, status: :ok
          else
            render json: { error: 'Erro ao criar matéria.' }, status: :unprocessable_entity
          end
        else
          render json: { error: 'Usuário não autorizado' }, status: :unauthorized
        end
      end

      # Atualizar matéria
      def update
        if current_user.admin?
          topic = Topic.find(params[:id])
          if topic.update(topic_params)
            render json: {status:'SUCCESS', message:'Matéria atualizada com sucesso', data:topic}, status: :ok
          else 
            render json: { error: 'Erro ao atualizar matéria.' }, status: :unprocessable_entity
          end
        else
          render json: { error: 'Usuário não autorizado' }, status: :unauthorized
        end
      end

      # Deletar matéria
      def destroy
        if current_user.admin?
          topic = Topic.find(params[:id])
          topic.destroy
          render json: {status: 'SUCCESS', message: 'Matéria excluída com sucesso'}, status: :ok

        else
          render json: { error: 'Usuário não autorizado' }, status: :unauthorized
        end
      end

      private 

      def topic_params
        params.permit(:name)
      end

    end
  end
end
