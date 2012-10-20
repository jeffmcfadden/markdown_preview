# Markdown Preview for Rails

This gem gives you instant markdown preview for any textarea you want, anywhere in your application.

## Installation

1. Add to your Gemfile:

    `gem 'markdown_preview'`

2. Include the assets where you want them

    `//= require markdown_preview/base`


3. (Optional) If you want to override the preprocessor then add the following to `config/initializers/markdown_preview.rb`

    ```ruby
    module MarkdownPreview
     
      #Write your own preprocessor here if you want to
      #the md param is the incoming markdown text, before it has been processed
      def self.preprocess_markdown( md )
        md 
      end
    
    end
    ```
   
4. Add the `markdown_preview` class to any textareas you want to be previewable, and you're good to go!

    ```html
    <textarea class="markdown_preview" id="my_awesome_textarea"></textarea>
    ``` 


## Issues

https://github.com/jeffmcfadden/markdown_preview/issues

## Credits

Jeff McFadden

Desiring God Ministries

