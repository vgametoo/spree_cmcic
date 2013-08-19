class Spree::Gateway::Cmcic < Spree::Gateway

  def method_type
    'cmcic'
  end


  def source_required?
    false
  end

  
end