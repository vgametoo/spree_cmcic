class SpreeCmcicController < Spree::BaseController

  def show
    @order = Order.find(params[:order_id])
    @gateway = @order.available_payment_methods.find{|x| x.id == params[:gateway_id].to_i }

    if @order.blank? || @gateway.blank?
      flash[:error] = I18n.t('invalid_arguments')
      redirect_to :back
    else

    end
  end

end
