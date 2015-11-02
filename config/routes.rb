Rails.application.routes.draw do
  resources :students
  resources :courses do
    resources :assignments
  end
  resources :courses do
    resources :lightbulbs
  end
  resources :submissions
  resources :teachers
  resources :enrollments
  resources :lightbulbs

  # get '/student/sign_up' => 'devise/registrations#new'
  get '/student_dashboard' => 'student_dashboard#index'
  get '/teacher_dashboard' => 'teacher_dashboard#index'
  get  '/login', to: 'sessions#new',    as: 'new_login'
  get  '/teacher_login', to: 'sessions#new_teacher_session',    as: 'teacher_login'
  post '/login', to: 'sessions#create', as: 'create_session' #username, pw params passed in
  post '/login', to: 'sessions#create_teacher_session', as: 'create_teacher_session' #username, pw params passed in
  get '/logout', to: 'sessions#destroy', as: 'logout'
  root 'application#homepage'
end
