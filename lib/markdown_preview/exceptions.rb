module MarkdownPreview 
  # Setup a couple of Exception classes that we use later on
  class MarkdownPreviewInvalidOption < Exception
    def self.invalid_option(option)
      new "Invalid option #{option} passed to MarkdownPreview"
    end
  end

  class MarkdownPreviewInvalidOptionType < Exception
    def self.invalid_type_of(value, parameters={})
      new "Invalid value of type #{value.class} passed for MarkdownPreview option #{parameters[:for].to_s}"
    end
  end
end
