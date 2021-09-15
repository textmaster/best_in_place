require 'rails/railtie'
require 'action_view/base'

module BestInPlace
  class Railtie < ::Rails::Railtie #:nodoc:
    config.after_initialize do
      BestInPlace::ViewHelpers =
        if ActionView::Base.respond_to?(:empty)
          ActionView::Base.empty
        else
          ActionView::Base.new({}, {}, '')
        end
    end
  end
end
