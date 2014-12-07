KingswoodGarageSale::Application.routes.draw do

  devise_for :conversation_user

  mount Shoppe::Engine => "/admin"

  get 'search' => 'products_searchs#index', :as => 'search'

  # product view and buy
  get 'product/:permalink' => 'products#show', :as => 'product'
  post 'product/:permalink' => 'products#buy'

  # cart
  get 'cart' => 'orders#show'
  delete 'cart' => 'orders#destroy'
  match 'cart' => 'orders#delete', :via => :post
  patch 'cart' => 'orders#update'
  #

  # checkout
  match 'checkout' => 'orders#checkout', :as => 'checkout', :via => [:get, :patch]
  match 'checkout/pay' => 'orders#payment', :as => 'checkout_payment', :via => [:get, :post]
  match 'checkout/confirm' => 'orders#confirmation', :as => 'checkout_confirmation', :via => [:get, :post]

  # header
  get 'admin' => 'admin'

  # footer
  get 'help' => 'admin_helps#index'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  root :to => 'products#index'

  authenticated :conversation_user do
    get "help" => "admin_helps#index"
  end

  unauthenticated :conversation_user do
    devise_scope :conversation_user do
      get "help" => "conversation_users/sign_up#index"
    end
  end

  resources :conversations do
    resources :conversation_messages
  end

end
