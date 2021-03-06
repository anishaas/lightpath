Rails.application.routes.draw do
  post '/webliographyentries/post_to_api' => 'webliographyentries#post_to_api'
  resources :messages
  resources :students
  resources :courses do
    resources :assignments
  end
  resources :courses do
    resources :lessons
  end
  resources :courses do
    resources :lightbulbs
  end
  resources :assignments do
    resources :submissions
  end
  resources :teachers
  resources :enrollments
  resources :favorites
  get '/courses/:id/summaries' => 'courses#summaries', as: 'summaries'
  get '/courses/:id/useful_links' => 'courses#useful_links', as: 'useful_links'
  get 'courses/:course_id/lesson/:id' => 'lessons#show'
  # get '/student/sign_up' => 'devise/registrations#new'
  get '/lightbulbs' => 'lightbulbs#create', as: "lightbulbs"
  post '/lightbulbs' => 'lightbulbs#new', as: "new_lightbulb"
  # post '/courses/:id' => 'courses#search_classmates', as: 'search_classmates'
  post '/courses/:id/send_lightbulb' => 'courses#send_lightbulb', as: 'send_lightbulb'
  post '/courses/:id' => 'courses#search_classmates', as: 'search_classmates'
  post '/courses/:id/topicsearch' => 'courses#search', as: 'search_assignments'
  get '/student_dashboard' => 'student_dashboard#index'
  get '/teacher_dashboard' => 'teacher_dashboard#index'
  get  '/login', to: 'sessions#new',    as: 'new_login'
  get  '/teacher_login', to: 'sessions#new_teacher_session',    as: 'teacher_login'
  post '/login', to: 'sessions#create', as: 'create_session' #username, pw params passed in
  post '/login', to: 'sessions#create_teacher_session', as: 'create_teacher_session' #username, pw params passed in
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/about', to: 'application#about', as: 'about'
  root 'application#homepage'
end
