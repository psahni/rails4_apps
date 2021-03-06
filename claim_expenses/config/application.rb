require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Assets should be precompiled for production (so we don't need the gems loaded then)
Bundler.require(*Rails.groups(assets: %w(development test)))

module ClaimExpenses
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)
        
    ## Enable parameter wrapping for JSON. You can disable this by setting :format to an empty array.
    #ActionController::Base.wrap_parameters :format => [:json]
    ## Disable root element in JSON by default.
    #if defined?(ActiveRecord)
    # ActiveRecord::Base.include_root_in_json = false
    #end
        
  end
end
