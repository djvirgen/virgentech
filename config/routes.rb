Virgentech::Application.routes.draw do
  # Home Page
  root :to => "home#index"

	# Register
  match '/register',
  	:to => 'users#new',
		:as => 'register'

	# Login
  match '/login',
  	:to => 'sessions#new',
  	:as => 'login'
  	
  # Blog
  match '/blog',
    :to => 'blogs#index',
    :as => 'blog_index'

	# Logout
  match '/logout',
  :to => 'sessions#destroy', 
  :as => 'logout'

  # View Blog Entry
  match "/blog/:year/:month/:url" => "blogs#view", 
    :constraints => {
      :year => /\d{4}/,
      :month => /\d{2}/,
      :url => /[a-zA-Z0-9-]+/
    }

	# Resources
  resources :blogs
  resources :users
  resources :pages
  resources :sessions,			:only => [:new, :create, :destroy]
  
  # Everything else maps to a content "page"
  match '*url',							:to => 'pages#show',
  													:as => 'page'
end
