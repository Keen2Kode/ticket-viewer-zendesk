Rails.application.routes.draw do
  get 'response/index'
  resources :tickets
  
  # to DRY up code so controllers don't have to specify the path it's on
  # just call requests.path
  root to: redirect('/tickets')
end
