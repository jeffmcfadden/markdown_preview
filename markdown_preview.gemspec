Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'markdown_preview'
  s.version     = '0.1.7'
  s.authors = ["Jeff McFadden"]
  s.email = "jeff.mcfadden@gmail.com"
  s.homepage = "http://github.com/jeffmcfadden/markdown_preview"
  s.summary = "Markdown Preview of any textarea editor for your rails applications."
  s.description = "Gem that allows easy preview of your textarea content as markdown."
  
  s.required_ruby_version = '>= 1.9.2'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('rdiscount')
end
