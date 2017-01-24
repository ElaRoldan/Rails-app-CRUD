Rails.application.routes.draw do
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #tells Rails to map requests to http://localhost:3000/welcome/index to the welcome controller's index action.
  #get 'welcome/index'
  resources :articles
  #tells Rails to map requests to the root of the application to the welcome controller's index action 
  root 'welcome#index'
  get '/articles/:id(.:format)', to: 'articles#show' 
  get '/articles(.:format)', to: 'articles#index'  
  delete '/articles/:id(.:format)', to: 'articles#destroy'

end
