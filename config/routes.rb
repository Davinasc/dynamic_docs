Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/index'

  devise_for :users
  resources :users

  get 'documents/:id/arquivo', to: 'documents#gerar_pdf', as: 'document_pdf'
  get 'documents/:id/download', to: 'documents#gerar_word', as: 'document_word'

  resources :templates do
    resources :documents, only: [:new, :create, :edit, :update]
  end
  resources :documents, only: [:index, :show, :destroy]
  resources :types do
    get 'templates', to: 'templates#list_by_type', as: 'templates_list'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
