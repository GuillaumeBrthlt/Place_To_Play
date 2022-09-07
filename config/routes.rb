Rails.application.routes.draw do
  
  resources :venue_profiles
  resources :artist_profiles

  get 'profile_selection/show'
  get 'contact/show'
  get 'about/show'
  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
