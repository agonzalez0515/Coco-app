Rails.application.routes.draw do

  # CHATROOM
  resources :chats, only: [:index, :create]


  # INFORMATIONAL PAGES:
  resources :sats, only: [:index]
  get '/agrequirements' => 'requirements#information'

  resources :applications, only: [:index]

  # USERS PROFILE ROUTES
  resources :users do
    resources :requirements, except: [:destroy] do
      member do
        post 'decrease_years'
      end
    end
    resources :events
  end

  # TIPS FOR ADMIN USE
  resources :tips, only: [:index]


  # FORUM ROUTES
  resources :messages do
    resources :comments
    collection do
      post 'search'
    end
  end


  # HOMEPAGE ROUTES
  root 'welcome#index'
  get '/home' => 'welcome#index'


  # SIGN UP AND LOGIN ROUTES
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'

  mount ActionCable.server, at: '/cable'
end
