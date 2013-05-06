ChaplinExample::Application.routes.draw do
  resources :users, :only => [:create]
  root :to => 'hello_world#show'
end
