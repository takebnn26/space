Rails.application.routes.draw do

  devise_for :users
  root 'groups#index'

  get 'users/search' => 'users#search'
  resources :groups, only: [:new, :create, :edit, :update] do
    scope module: 'groups' do
      resources :messages, only: [:index, :create]
    end
  end
end
