Rails.application.routes.draw do

  resources :categories
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  scope :admin do
    resources :users
    resources :stores
    resources :roles
    resources :properties
  end
  resources :sales
  root to: 'sales#index'

end
