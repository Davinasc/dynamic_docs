Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/index'

  resources :templates do
    resources :documents
  end
  resources :types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
