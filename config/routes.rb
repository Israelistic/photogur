Rails.application.routes.draw do
resources :users
resources :sessions

    root 'pictures#index'
    get 'pictures' => 'pictures#index'
    post 'pictures' => 'pictures#create'
    get 'pictures/new' => 'pictures#new'
    get 'pictures/:id' => 'pictures#show'
    get 'pictures/:id/edit' => 'pictures#edit'
    patch 'pictures/:id' => 'pictures#update'
    delete 'pictures/:id' => 'pictures#destroy'

end
