MusicApp::Application.routes.draw do
  
  
  
  resources :users, only: [:show, :index, :new, :create]
  resource :session
  
  resources :bands do
    resources :albums, only: [:index, :new, :create]
  end
  
  resources :albums, except: [:index, :new, :create] do
    resources :tracks, only: [:new, :create, :index]
  end
  
  resources :tracks, except: [:index, :new, :create] do
    resources :notes, only: [:index, :create]
  end
  
end
