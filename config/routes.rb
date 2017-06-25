Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :ebay_stores
    resources :ebay_products

    post 'ebay_products/all'

    resources :ebay_listings, only: [:show]
  end
end
