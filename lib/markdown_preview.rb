# Require all the necessary files to run MarkdownPreview
require 'markdown_preview/base'
require 'markdown_preview/exceptions'
require 'markdown_preview/helpers'

module MarkdownPreview
  def self.initialize
    return if @intialized
    raise "ActionController is not available yet." unless defined?(ActionController)
    ActionController::Base.send(:include, MarkdownPreview::Base)
    ActionController::Base.send(:helper, MarkdownPreview::Helpers)
    @intialized = true
  end

  #Override this is a config somewhere if you want to preprocess your incoming
  #markdown string. i.e. add a custom tag or something.
  def self.preprocess_markdown( markdown )
    markdown
  end

  module Base
  end

  class Engine < Rails::Engine
    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      #Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*.rb")) do |c|
      # Rails.env.production? ? require(c) : load(c)
      #end

    end

    config.to_prepare &method(:activate).to_proc
  end
end
      
MarkdownPreview.initialize
