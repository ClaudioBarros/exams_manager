module Api      
  module V1
    class AlternativesController < ApplicationController

      before_action :require_admin

      #Listar todas as alternativas ordenadas por questão
      def index 
        alternatives = Alternative.order('question_id DESC')
        render json: {
          status: 'SUCCESS', 
          message:'Alternativas:', 
          data: alternatives
        },status: :ok
      end

      #Exibit uma alternativa
      def show
        alternative = Alternative.where(["id = ?", params[:id]])
        render json: {
          status: 'SUCCESS', 
          message:'Alternativas:', 
          data: alternative
        },status: :ok
      end

      # Criar novas alternativas
      def create
        begin
          Alternative.transaction do
            alt = Alternative.create!(alternative_params)
          end
        rescue ActiveRecord::RecordInvalid => exception
          render json: { 
            error: 'Erro ao criar alternativas.',
            message: exception
          },status: :unprocessable_entity
          return
        end
          render json: {
            status:'SUCCESS', 
            message:'Alternativas criadas com sucesso'
          },status: :ok
      end

      #Atualizar alternativa
      #TODO: Permitir multiplos updates em uma unica requisicao
      def update
        alternative = Alternative.find(params[:id])
        if alternative.update(alternative_params_update)
          render json: {
            status:'SUCCESS', 
            message:'Alternativa atualizada com sucesso',
            data: alternative 
          },status: :ok
        else
          render json: { 
            error: 'Erro ao atualizar alternativa.' 
          },status: :unprocessable_entity
        end
      end

      #Deletar alternativa
      def destroy 
        begin
          Alternative.transaction do
            alt = Alternative.destroy(params[:id])
          end
        rescue ActiveRecord::RecordInvalid => exception
          render json: {
              error: 'Erro ao deletar alternativas.',
              message: exception
            },status: :unprocessable_entity
          return
        end
          render json:{
            status:'SUCCESS', 
            message:'Alternativas deletadas com sucesso'
          },status: :ok
      end

      private 
      def alternative_params
        params.permit(alternatives: [:question_id,
                       :statement,
                       :value]).require(:alternatives)
      end

      def alternative_params_update
        params.permit(:question_id,:statement,
                       :value)
      end

      def alternative_params_destroy
        params.permit(alternatives: [:id]).require(:alternatives)
      end
    end
  end
end
