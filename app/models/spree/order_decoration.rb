module Spree
  Order.class_eval do

  # Confirmation step not compatible with CM-CIC paiement
  def confirmation_required?
    return "toto"
  end
  
  def cmcic_sDevise
    self.currency
  end
  
  def cmcic_sDate
    self.created_at.strftime("%d/%m/%Y:%H:%M:%S")
  end

  def cmcic_sMontant
    ("%.2f" % self.total) + cmcic_sDevise
  end
  
  def cmcic_sReference
    self.number
  end
  
  def cmcic_email
    self.email
  end

  def cmcic_sTexteLibre
    self.special_instructions.nil? ? "" : self.special_instructions
  end
  
  def cmcic_sNbrEch
    ""
  end
  
  def cmcic_sDateEcheance1
    ""
  end

  def cmcic_sDateEcheance2
    ""
  end

  def cmcic_sDateEcheance3
    ""
  end

  def cmcic_sDateEcheance4
    ""
  end
  
  def cmcic_sMontantEcheance1
    ""
  end

  def cmcic_sMontantEcheance2
    ""
  end

  def cmcic_sMontantEcheance3
    ""
  end

  def cmcic_sMontantEcheance4
    ""
  end
  
  def cmcic_sOptions
    ""
  end

  def cmcic_sMAC_Tpe(oTpe)
    sChaineMAC = [oTpe.sNumero, cmcic_sDate, cmcic_sMontant, cmcic_sReference, cmcic_sTexteLibre, oTpe.sVersion, oTpe.sLangue, oTpe.sCodeSociete, cmcic_email, cmcic_sNbrEch, cmcic_sDateEcheance1, cmcic_sMontantEcheance1, cmcic_sDateEcheance2, cmcic_sMontantEcheance2, cmcic_sDateEcheance3, cmcic_sMontantEcheance3, cmcic_sDateEcheance4, cmcic_sMontantEcheance4, cmcic_sOptions].join("*")
    
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new("sha1"), oTpe.getPackCle, sChaineMAC).upcase
  end  
end
end