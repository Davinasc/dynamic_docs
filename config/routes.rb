Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/index'

  resources :templates do
    resources :documents, only: [:new, :create, :edit, :update]
  end
  resources :documents, only: [:index, :show, :destroy]
  resources :types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
