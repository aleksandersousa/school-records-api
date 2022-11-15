Rails.application.routes.draw do
  devise_for :users,
              controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
              }

  get 'ping' => ->(_) { [200, {}, ['pong']] }
  
  scope '/', defaults: { format: :json } do
    resources :type_of_results, only: %i[index show]
    resources :courses
    resources :results
    resources :college_subjects
    resources :students do
      member do
        get :results
      end
    end
  end
end
