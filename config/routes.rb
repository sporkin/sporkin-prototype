ChaplinExample::Application.routes.draw do
  post "/login", :to => "sessions#create"
  resources :users, :only => [:create]
  root :to => 'hello_world#show'
end
