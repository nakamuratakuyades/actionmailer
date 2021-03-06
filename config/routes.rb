Rails.application.routes.draw do
  resources :feeds do
    collection do
      post :confirm
    end
  end

  resources :contacts
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :favorites, only: [:create, :destroy]
  resources :blogs do
    collection do
      post :confirm
    end
  end

  get '/', to: 'tops#index'
  get '/tops', to: 'tops#index'
  get '/contacts', to: 'blogs#contact'
  get '/login', to: 'sessions#new'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
