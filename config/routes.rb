Rails.application.routes.draw do

  devise_for :users
  root 'groups#index'

  scope module: 'groups' do
    resources :groups, only: [:new, :create, :edit, :update] do
      resources :messages, only: [:index]
    end
  end
end
