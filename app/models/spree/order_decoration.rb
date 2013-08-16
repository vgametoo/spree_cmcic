Spree::Order.class_eval do

  # Confirmation step not compatible with CM-CIC paiement
  def confirmation_required?
    return false
  end

end