module SpreeCmcic
  class Engine < Rails::Engine
    engine_name 'spree_cmcic'

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
#      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
#        Rails.application.config.cache_classes ? require(c) : load(c)
#      end

      Dir.glob(File.join(File.dirname(__FILE__), "../../app/overrides/*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end
      
    initializer "spree_cmcic.register.payment_methods" do |app|
      app.config.spree.payment_methods += [ Spree::BillingIntegration::Cmcic ]
    end
    
    config.to_prepare &method(:activate).to_proc
  end
end