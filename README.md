# Markdown Preview for Rails

This gem gives you instant markdown preview for any textarea you want, anywhere in your application.

## Installation

1. Add to your Gemfile:
   ```ruby
    `gem 'markdown_preview'`
    `gem 'rdiscount', '1.6.8' # Markdown Preview will fail with newer versions of RDiscount

2. Run the Rake task:

    `rake markdown_preview:install`

3. Add helper to any controllers you want to use markdown_preview with:

    ```ruby
      class MyController < ApplicationController
      
       uses_markdown_preview
    ```

4. Add the helper tag to your base layout:

    ```html
    <!-- Note, jQuery include *required* above this line. -->
    <%= include_markdown_preview_if_needed %>
    ```

5. (Optional) If you want to override the preprocessor then add the following to `config/initializers/markdown_preview.rb`

    ```ruby
    module MarkdownPreview
     
      #Write your own preprocessor here if you want to
      #the md param is the incoming markdown text, before it has been processed
      def self.preprocess_markdown( md )
        md 
      end
    
    end
    ```
   
6. Add the `markdown_preview` class to any textareas you want to be previewable, and you're good to go!

    ```html
    <textarea class="markdown_preview" id="my_awesome_textarea"></textarea>
    ``` 


## Issues

https://github.com/jeffmcfadden/markdown_preview/issues

## Credits

Jeff McFadden

Desiring God Ministries

