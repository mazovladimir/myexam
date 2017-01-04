Rails.application.routes.draw do
  devise_for :users 
  resources :users do
    resources :questions
    resources :results
  end

  get 'results', to: 'results', controller: 'questions'
  get 'generate_questions', to: 'generate_questions', controller: 'questions'
  
  root to: 'questions#generate_questions'
end
