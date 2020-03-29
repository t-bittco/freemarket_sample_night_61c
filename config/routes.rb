Rails.application.routes.draw do
  get '/mypage/identification', to: 'mypage#identification'
  get '/mypage/profile', to: 'mypage#profile'
  get 'logout/index'
  get '/signup/done', to: 'signup#done'
  get '/signup/index', to: 'signup#index'
  get '/addresses/new', to: 'addresses#step3'
  

  devise_for :users,
  controllers: {
  sessions: 'users/sessions',
  registrations: "users/registrations",
  omniauth_callbacks: 'users/omniauth_callbacks'
  # omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'gifts#index'
  resources :gifts do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :signup do
    collection do
      get 'index'
      get 'done' 
    end
  end

  devise_scope :user do
    get    'users/signup/registration',   to: 'users/registrations#step1'
    get    'users/signup/sms_confirmation',      to: 'users/registrations#step2'
  end
  resources :addresses, only:[:create,:update]
  resources :logout, only: [:index]
  
  resources :mypage, only: [:index]
  resources :cards, only: [:index, :new] do
    collection do
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done/：gift_id', to: 'purchase#done'
    end
  end
end
