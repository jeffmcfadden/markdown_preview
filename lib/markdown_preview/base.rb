module MarkdownPreview 
  # The base module we include into ActionController::Base
  module Base
    # When this module is included, extend it with the available class methods
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      # The controller declaration to enable markdown_preview certain actions.
      # Takes options hash, raw_options string, and any normal params you
      # can send to a before_filter (only, except etc)
      def uses_markdown_preview(options = {})
        configuration = MarkdownPreview::Configuration.new(options.delete(:options), options.delete(:raw_options))
        
        # Set instance vars in the current class
        proc = Proc.new do |c|
          configurations = c.instance_variable_get(:@markdown_preview_configurations) || []
          configurations << configuration
          c.instance_variable_set(:@markdown_preview_configurations, configurations)
          c.instance_variable_set(:@uses_markdown_preview, true)
        end

        # Run the above proc before each page load this method is declared in
        before_filter(proc, options)
      end
    end
  end
end
