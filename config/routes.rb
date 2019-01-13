Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :attachments, only:[:new,:create,:destroy]

  authenticated :user do
  	root 'welcome#index'
  end

  unauthenticated :user do
  	devise_scope :user do
  		root 'welcome#unregistered', as: :unregistered_root
  	end
  end
end
