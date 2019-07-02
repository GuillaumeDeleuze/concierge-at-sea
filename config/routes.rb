Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    authenticated :user do
      root 'pages#dashboard', as: :authenticated_root
    end
    
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  get '/dashboard' => 'pages#dashboard'
  get '/profile' => 'pages#profile'
  get '/agenda' => 'pages#agenda'
  get '/order' => 'pages#order'
  get '/map' => 'pages#map'
  get '/beverages/tea' => 'beverages#tea_index'
  get '/beverages/softdrink' => 'beverages#soft_drink_index'
  get '/beverages/alcohol' => 'beverages#alcohol_index'
  get '/beverages/cocktail' => 'beverages#cocktail_index'
  get '/beverages/coffee' => 'beverages#coffee_index'
  get '/beverages/alldaydining' => 'beverages#all_day_dining_index'
  
 # Ajouter routes CRUDS lors de la création yatch_charter 
  resources :yatches, only: [:show, :index] do 
    resources :bookings, only: [:index, :new, :create]
    resources :users, only: [:new, :create]
    resources :activities, only: [:index]
  end

  resources :bookings, only: [:show, :edit, :update, :destroy] do
    resources :beverages, only: [:index]
    resources :menus, only: [:index]
    resources :chatrooms, only: [:index, :new, :create]
  end

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resources :guest_informations, only: [:new, :create]
    resources :guest_preferences, only: [:new, :create]
  end
  
  resources :chatrooms, only: [:show] do 
    resources :messages, only: [:index, :create]
  end
  
  resources :guest_informations, only: [:show, :edit, :update]
  resources :guest_preferences, only: [:show, :edit, :update]
  resources :activities, only: [:show, :edit, :update]
  resources :tenders, only: [:show, :edit, :update]
  resources :beverages, only: [:edit, :update]
end
