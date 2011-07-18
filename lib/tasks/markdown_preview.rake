namespace :markdown_preview do

  desc 'Install or update the Markdown Preview sources'
  task :install => :environment do
    MarkdownPreview.install_or_update_markdown_preview
  end

end
