Spree::Core::Engine.routes.prepend do
  
    match '/spree_cmcic/:gateway_id/:order_id' => 'spree_cmcic#show', :as => :spree_cmcic
end