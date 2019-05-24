Rails.application.routes.draw do
  devise_for :users
  get '/dashboard' => 'pages#dashboard'
  get '/profile' => 'pages#profile'
  get '/agenda' => 'pages#agenda'
  get '/order' => 'pages#order'
  get '/map' => 'pages#map'
  get '/beverages/hotdrink' => 'beverages#hot_drink_index'
  get '/beverages/softdrink' => 'beverages#soft_drink_index'
  get '/beverages/alcohol' => 'beverages#alcohol_index'
  get '/beverages/alldaydining' => 'beverages#all_day_dining_index'
  
  authenticated :user do
    root 'pages#dashboard'
  end
  
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
 # Ajouter routes CRUDS lors de la création yatch_charter 
  resources :yatches, only: [:show, :index] do 
    resources :bookings, only: [:index, :new, :create]
    resources :users, only: [:new, :create]
    resources :activities, only: [:index]
  end

  resources :bookings, only: [:show, :edit, :update, :destroy] do
    resources :beverages, only: [:index]
    resources :menus, only: [:index]
  end

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resources :guest_informations, only: [:new, :create]
    resources :guest_preferences, only: [:new, :create]
  end
  
  resources :guest_informations, only: [:show, :edit, :update]
  resources :guest_preferences, only: [:show, :edit, :update]
  resources :activities, only: [:show, :edit, :update]
  resources :tenders, only: [:show, :edit, :update]
  resources :beverages, only: [:edit, :update]
end
