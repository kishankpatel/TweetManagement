Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api, defaults: { format: :json } do
    resources :tweets 
    post '/login', to: 'sessions#create'
    post '/forgot_password' => 'password_resets#create'
    patch '/password_resets/:token' => 'password_resets#update'
  end
end
