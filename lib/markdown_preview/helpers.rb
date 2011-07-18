module MarkdownPreview
  # The helper module we include into ActionController::Base
  module Helpers

    # Has uses_markdown_preview method been declared in the controller for this page?
    def using_markdown_preview?
      !@uses_markdown_preview.blank?
    end

    # Form a JS include tag for the MarkdownPreview JS src for inclusion in the <head>
    def include_markdown_preview_js
      #javascript_include_tag (Rails.env.to_s == 'development' ? "markdown_preview/markdown_preview" : "markdown_preview/markdown_preview.min")
      javascript_include_tag (Rails.env.to_s == 'development' ? "markdown_preview/markdown_preview" : "markdown_preview/markdown_preview")
    end
    
    # Form a JS include tag for the MarkdownPreview JS src for inclusion in the <head>
    def include_markdown_preview_css
      stylesheet_link_tag( "markdown_preview/markdown_preview" )
    end

    # Form a JS include tag for the MarkdownPreview JS src, and form the raw JS and wrap
    # in in a <script> tag for inclusion in the <head> for inclusion in the <head>
    def include_markdown_preview_if_needed(options = {}, raw_options = nil)
      if using_markdown_preview?
        include_markdown_preview_js + include_markdown_preview_css 
      end
    end
  end
end
