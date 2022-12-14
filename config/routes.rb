Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get '/orders/complete' => 'public/orders#complete'
scope module: :public do
  root to: "homes#top"
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :update, :destroy, :create] do
    collection do
      delete 'destroy_all'
    end
  end
  resources :orders, only: [:new, :create, :index, :show]

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
end

  post '/orders/confirm' => 'public/orders#confirm'
  get '/customers/information/edit' => 'public/customers#edit'
  patch '/customers/information' => 'public/customers#update'
  get '/customers/unsubscribe' => 'public/customers#unsubscribe'
  patch '/customers/withdraw' => 'public/customers#withdraw'
  get '/about' => 'public/homes#about', as: :about
  get '/customers/my_page' => 'public/customers#show'
  get '/search' => 'public/searches#search'
  get '/admin' => 'admin/homes#top', as: :admin

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end



end
