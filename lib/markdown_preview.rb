# Require all the necessary files to run MarkdownPreview
require 'markdown_preview/base'
require 'markdown_preview/exceptions'
require 'markdown_preview/configuration'
require 'markdown_preview/helpers'

module MarkdownPreview
  def self.initialize
    return if @intialized
    raise "ActionController is not available yet." unless defined?(ActionController)
    ActionController::Base.send(:include, MarkdownPreview::Base)
    ActionController::Base.send(:helper, MarkdownPreview::Helpers)
    MarkdownPreview.install_or_update_markdown_preview
    @intialized = true
  end

  #Override this is a config somewhere if you want to preprocess your incoming
  #markdown string. i.e. add a custom tag or something.
  def self.preprocess_markdown( markdown )
    markdown
  end

  def self.install_or_update_markdown_preview
    require 'fileutils'
    orig = File.join(File.dirname(__FILE__), 'markdown_preview', 'assets', 'markdown_preview')
    dest = File.join(Rails.root.to_s, 'public', 'javascripts', 'markdown_preview')
    markdown_preview_js = File.join(dest, 'markdown_preview.js')

    unless File.exists?(markdown_preview_js) && FileUtils.identical?(File.join(orig, 'markdown_preview.js'), markdown_preview_js)
      if File.exists?(markdown_preview_js)
        # upgrade
        begin
          puts "Removing directory #{dest}..."
          FileUtils.rm_rf dest
          puts "Creating directory #{dest}..."
          FileUtils.mkdir_p dest
          puts "Copying MarkdownPreview to #{dest}..."
          FileUtils.cp_r "#{orig}/.", dest
          puts "Successfully updated MarkdownPreview."
        rescue
          puts 'ERROR: Problem updating MarkdownPreview. Please manually copy '
          puts orig
          puts 'to'
          puts dest
        end
      else
        # install
        begin
          puts "Creating directory #{dest}..."
          FileUtils.mkdir_p dest
          puts "Copying MarkdownPreview to #{dest}..."
          FileUtils.cp_r "#{orig}/.", dest
          puts "Successfully installed MarkdownPreview."
        rescue
          puts "ERROR: Problem installing MarkdownPreview. Please manually copy "
          puts orig
          puts "to"
          puts dest
        end
      end
    end



    orig = File.join(File.dirname(__FILE__), 'markdown_preview', 'assets', 'markdown_preview')
    dest = File.join(Rails.root.to_s, 'public', 'stylesheets', 'markdown_preview')
    markdown_preview_css = File.join(dest, 'markdown_preview.css')

    unless File.exists?(markdown_preview_css) && FileUtils.identical?(File.join(orig, 'markdown_preview.css'), markdown_preview_css)
      if File.exists?(markdown_preview_css)
        # upgrade
        begin
          puts "Removing directory #{dest}..."
          FileUtils.rm_rf dest
          puts "Creating directory #{dest}..."
          FileUtils.mkdir_p dest
          puts "Copying MarkdownPreview to #{dest}..."
          FileUtils.cp_r "#{orig}/.", dest
          puts "Successfully updated MarkdownPreview."
        rescue
          puts 'ERROR: Problem updating MarkdownPreview. Please manually copy '
          puts orig
          puts 'to'
          puts dest
        end
      else
        # install
        begin
          puts "Creating directory #{dest}..."
          FileUtils.mkdir_p dest
          puts "Copying MarkdownPreview to #{dest}..."
          FileUtils.cp_r "#{orig}/.", dest
          puts "Successfully installed MarkdownPreview."
        rescue
          puts "ERROR: Problem installing MarkdownPreview. Please manually copy "
          puts orig
          puts "to"
          puts dest
        end
      end
    end
    

  
  
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
