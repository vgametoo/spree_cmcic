Rails.application.routes.draw do
  namespace :gateway do
    match '/cmcic/:gateway_id/:order_id' => 'cmcic#show', :as => :cmcic
  
  end
end