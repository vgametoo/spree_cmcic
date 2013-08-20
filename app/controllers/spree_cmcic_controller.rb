class SpreeCmcicController < ApplicationController
  respond_to :html

  def show
    @order = Spree::Order.find(params[:order_id])
    @gateway = @order.available_payment_methods.find{|x| x.id == params[:gateway_id].to_i }

    if @order.blank? || @gateway.blank?
      flash[:error] = I18n.t('invalid_arguments')
      redirect_to :back
    else
      
      @order.update_attribute(:payment_date, @order.updated_at)

    end
    
    respond_to do |format|
      format.html { render 'show', :layout => false }
    end
  end

end
