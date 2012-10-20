module MarkdownPreview
  #Override this is a config somewhere if you want to preprocess your incoming
  #markdown string. i.e. add a custom tag or something.
  def self.preprocess_markdown( markdown )
    markdown
  end

  class Engine < Rails::Engine
    engine_name :markdown_preview
    isolate_namespace MarkdownPreview
  end
end
