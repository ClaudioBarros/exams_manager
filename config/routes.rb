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

      #ExamQuestions
      resources :exam_questions, only: [:index, :create]
      get '/exam_questions/:eid/:qid', to: 'exam_questions#show', :as => :exam_questions_show
      put '/exam_questions/:eid/:qid', to: 'exam_questions#update', :as => :exam_questions_update
      delete '/exam_questions/:eid/:qid', to: 'exam_questions#destroy', :as => :exam_questions_destroy
      #UserAnswers
      resources :user_answers, only: [:index, :create, :destroy, :update]

      get '/user_answers/:eid', to: 'user_answers#index_by_exam', :as => :user_answers_index_by_exam
      get '/user_answers/:eid/:uid', to: 'user_answers#index_by_exam_and_user', :as => :user_answers_index_by_exam_and_user


    end
  end

end
