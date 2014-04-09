StudioVoronin::Application.routes.draw do

 
  get "test_slider/index"

  # prevent sign up as new admin
  match '/users/sign_up', :to => 'error#show', :code => 404
  match '/users', :to => 'error#show', :code => 404

  get 'articles/tags/:tag', to: 'page#articles_by_tags', as: :article_tag

  get "empty", to: 'empty#index'

  get "custom_grid/index"

  get "partial_test/portfolio", :to => 'partial_test#portfolio'
  get "partial_test/home-slider", :to => 'partial_test#home_slider'

  mount Ckeditor::Engine => '/ckeditor'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  

  # Define pages routes
  match 'about'   => 'page#about', :as => 'about'
  match 'service'   => 'page#service', :as => 'service'
  match 'articles'  => 'page#article', :as => 'article_list'
  
  #match 'articles/:id'  => 'page#article_item', :as => 'article'
 match 'artices/:id' => 'page#article_item', :as => 'article_item'
   match 'portfolio' => 'portfolio#index', :as => 'portfolio'

  # Portfolio routes
  #match 'portfolio/polygraphy' => 'portfolio#polygraphy', :as => 'portfolio_polygraphy'
  #match 'portfolio/polygraphy/:id' => 'portfolio#polygraphy_item', :as => 'portfolio_polygraphy_item'
  #match 'portfolio/corporate-identity' => 'portfolio#corporate_identity', :as => 'portfolio_corporate_identity'
  #match 'portfolio/corporate-identity/:id' => 'portfolio#corporate_identity_item', :as => 'portfolio_corporate_identity_item'
  #match 'portfolio/web' => 'portfolio#web', :as => 'portfolio_web'
  #match 'portfolio/web/:id' => 'portfolio#web_item', :as => 'portfolio_web_item'
  match 'portfolio/:category' => 'portfolio#category'
  match 'portfolio/:category/:item' => 'portfolio#item'

  # Contacts and contacts-modal routes
  match 'contact' => 'page#contact', :as => 'contact'
  match 'contact-modal' => 'page#contact_modal', :as => 'contact_modal'
  match 'order-us' => 'page#order_us', :as => 'order_us'
  match 'connect-with-us' => 'page#connect_with_us', :as => 'connect_us'



  # errors

  match "/404", :to => "error#show", :code => 404
  match "/422", :to => "error#show", :code => 404
  match "/500", :to => "error#show", :code => 404



  # Rooting application
  root :to        => 'page#index'
    
  #match '*a', :to => 'error#show', :code => 404



end
