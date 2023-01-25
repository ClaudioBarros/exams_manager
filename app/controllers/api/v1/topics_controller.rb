module Api      
  module V1
    class TopicsController < ApplicationController
      before_action :require_admin

      # Listar todas as matérias
      def index
        topics = Topic.order('created_at DESC');
        render json: {status: 'SUCCESS', message:"#{topics.size} Matéria(s):", data:topics}, status: :ok
      end
      
      # Exibir uma matéria
      def show
        topic = Topic.find(params[:id])
        render json: {status:'SUCCESS', message:'Matéria:', data:topic}, status: :ok
      end

      # Criar nova matéria
      def create
        topic = Topic.new(topic_params)
        if topic.save
          render json: {status:'SUCCESS', message:'Matéria criada com sucesso', data:topic}, status: :ok
        else
          render json: { error: 'Erro ao criar matéria.' }, status: :unprocessable_entity
        end
      end

      # Atualizar matéria
      def update
        topic = Topic.find(params[:id])
        if topic.update(topic_params)
          render json: {status:'SUCCESS', message:'Matéria atualizada com sucesso', data:topic}, status: :ok
        else 
          render json: { error: 'Erro ao atualizar matéria.' }, status: :unprocessable_entity
        end
      end

      # Deletar matéria
      def destroy
          topic = Topic.find(params[:id])
          topic.destroy
          render json: {status: 'SUCCESS', message: 'Matéria excluída com sucesso'}, status: :ok
      end

      private 

      def topic_params
        params.permit(:name)
      end

    end
  end
end
