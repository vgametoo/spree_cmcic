class Spree::BillingIntegration::Cmcic < Spree::BillingIntegration

  def redirect_url(order)
    
    spree_cmcic_order_checkout_url(self.id, order)
  end  
end