Rails.application.routes.draw do
  devise_for :users,
              controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
              }

  get 'ping' => ->(_) { [200, {}, ['pong']] }
  
  scope '/', defaults: { format: :json } do
    resources :courses
    resources :users, only: %i[create update]
    resources :type_of_results, only: %i[index show]
  end
end
