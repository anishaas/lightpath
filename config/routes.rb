Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers
  devise_for :users
  resources :lightbulbs
  resources :students
  resources :courses
  resources :teachers
  get '/student/sign_up' => 'devise/registrations#new'
  get '/student_dashboard' => 'student_dashboard#index'
  root 'application#homepage'
end
