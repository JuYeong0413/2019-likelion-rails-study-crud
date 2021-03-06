Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'posts#index'

  resources :posts do
    resources :comments, only: [:create, :destroy]
    # post '/like', to: 'likes#like_toggle'
   end

   post 'like_toggle/:post_id' => 'likes#like_toggle', as: :like_toggle
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
