module Prattle
  class Engine < ::Rails::Engine
    isolate_namespace Prattle

    config.to_prepare do
      Decorators.register! Engine.root, Rails.root
    end

  end
end

