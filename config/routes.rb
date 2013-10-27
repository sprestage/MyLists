MyLists::Application.routes.draw do
  resources :lists do
    resources :items
  end

  root :to => 'home#index'
end
