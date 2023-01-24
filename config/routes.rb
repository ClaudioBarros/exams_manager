Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace 'api' do
    namespace 'v1' do
      post 'authenticate', to: 'authentication#authenticate'

      resources :users
      resources :topics
      resources :questions
      resources :alternatives
      resources :exams
      resources :participants
      resources :user_answers

    end
  end

end
