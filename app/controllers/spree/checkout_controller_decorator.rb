module Spree
  CheckoutController.class_eval do
    before_filter :redirect_to_cmcic_if_needed, :only => [:update]
    
    def redirect_to_cmcic_if_needed
      return unless (params[:state] == "payment")
      return unless params[:order][:payments_attributes]

      payment_method = Spree::PaymentMethod.find(params[:order][:payments_attributes].first[:payment_method_id])
      return unless payment_method.kind_of?(Spree::BillingIntegration::Cmcic)
      
      redirect_to edit_order_checkout_url(@order, :state => 'payment'),
                    :notice => 'Complete CB Paiement !'

    end

  end
end