Rails.application.routes.draw do
  get 'doses/index'
  get 'doses/new'
  get 'doses/create'
  get 'doses/show'
  get 'doses/destroy'
  get 'cocktails/index'
  get 'cocktails/create'
  get 'cocktails/new'
  get 'cocktails/show'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'pages#home'
  
  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:new, :create]
  end
  
  resources :doses, only: :destroy
end

