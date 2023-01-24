module Api      
  module V1
    class UsersController < ApplicationController
      
      before_action :require_admin
      
      # Listar todos os usuários
      def index
        users = User.select(["id", "name", "email", "admin"]).order('created_at DESC');
        render json: {
          status: 'SUCCESS', 
          message:'Usuários:', 
          data: users
        },status: :ok
      end

      # Exibir um usuário
      def show
        user = User.where(["id = ?", params[:id]]).select(
          "id", "name", "email", "admin").first
        render json: {
          status: 'SUCCESS', 
          message:'Usuário:', 
          data:user
        },status: :ok
      end

      #Criar novo usuário
      def create 
        user = User.new(user_params)
        if user.admin == nil
          user.admin = false
        end
      
        if user.save
          render json: {
            status:'SUCCESS', 
            message:'Usuário criado com sucesso'
          },status: :ok
        else
          render json: { 
            error: 'Erro ao criar usuário.'
          },status: :unprocessable_entity
        end
      end

      #Atualizar usuário
      def update
        user = User.find(params[:id])
        if user.update(user_params)
          render json: {
            status:'SUCCESS', 
            message:'Usuário atualizado com sucesso'
          },status: :ok
        else
          render json: { 
            error: 'Erro ao atualizar usuário.' 
          },status: :unprocessable_entity
        end
      end

      #Excluir usuário
      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {
          status: 'SUCCESS', 
          message:'Usuário excluído com sucesso'
        },status: :ok
      end
      
      private 
      def user_params
        params.permit(:name, :email, :password, :admin)
      end
    end
  end
end
