NewBooks::Engine.routes.draw do
  #get 'books', controller: 'books', action: :index
  resources 'books', only: %w(index)
end
