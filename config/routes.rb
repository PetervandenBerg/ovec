Ovec::Application.routes.draw do

  resources :projects do 
     resources :pictures
  end

  resources :activities

  devise_for :admins
  get "pages/home"

  root 'pages#home'

	match 'contact' => 'contact#new', :via => :get
	match 'contact' => 'contact#create', :via => :post
end
