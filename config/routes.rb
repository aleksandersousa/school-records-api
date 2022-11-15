Rails.application.routes.draw do
  devise_for :users

  get 'ping' => ->(_) { [200, {}, ['pong']] }
  
  scope '/', defaults: { format: :json } do
    resources :type_of_results, only: %i[index show]
  end
end
