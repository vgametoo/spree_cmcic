Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  resources :orders do
    resource :checkout do
      match '/spree_cmcic/:gateway_id/:order_id' => 'spree_cmcic#show', :as => :spree_cmcic
    end
  end
  
#    match '/spree_cmcic/:gateway_id/:order_id' => 'spree_cmcic#show', :as => :spree_cmcic
end