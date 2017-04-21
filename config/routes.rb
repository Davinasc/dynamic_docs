Rails.application.routes.draw do

  resources :templates do
    resources :documents
  end
  resources :types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
