(function( $ ){
  $.fn.markdownPreview = function() {  
    return this.each(function() {

      var $this = $(this);

      $this.wrap( '<div class="markdown_wrap editing"></div>' );

      $this.before( '<div class="markdown_wrap_menu"><div class="markdown_wrap_menu_help">Help</div><div class="markdown_wrap_menu_edit">Write</div><div class="markdown_wrap_menu_preview">Preview</div></div>' );

      var help_text = [
        '<div class="content cheatsheet">',
        '<h2>Markdown Cheat Sheet</h2>',
        '<div class="cheatsheet-content">',
        '<div class="mod">',
        '<div class="col">',
        '<h3>Format Text</h3>',
        '<p>Headers</p>',
        '<pre># This is an &lt;h1&gt; tag',
        '## This is an &lt;h2&gt; tag',
        '###### This is an &lt;h6&gt; tag</pre>',
        '    <p>Text styles</p>',
        '    <pre>*This text will be italic*',
        '_This will also be italic_',
        '**This text will be bold**',
        '__This will also be bold__',
        '',
        '*You **can** combine them*',
        '</pre>',
        '</div>',
        '<div class="col">',
        '<h3>Lists</h3>',
        '<p>Unordered</p>',
        '<pre>* Item 1',
        '* Item 2',
        '  * Item 2a',
        '  * Item 2b</pre>',
        '     <p>Ordered</p>',
        '     <pre>1. Item 1',
        '2. Item 2',
        '3. Item 3',
        '   * Item 3a',
        '   * Item 3b</pre>',
        '</div>',
        '<div class="col">',
        '<h3>Miscellaneous</h3>',
        '<p>Images</p>',
        '<pre>![GitHub Logo](/images/logo.png)',
        'Format: ![Alt Text](url)',
        '</pre>',
        '<p>Links</p>',
        '<pre>http://github.com - automatic!',
        '[GitHub](http://github.com)</pre>',
        '<p>Blockquotes</p>',
        '<pre>As Kanye West said:',
        '&gt; We\'re living the future so',
        '&gt; the present is our past.',
        '</pre>',
        '</div>',
        '</div>',
        '<div class="rule"></div>',
        '</div>',
        '</div>' ].join( "\n" );

      $this.before( '<div class="markdown_wrap_help">' + help_text + '</div>' );
      $this.wrap( '<div class="markdown_wrap_content"></div>' );
      $this.after( '<div class="markdown_wrap_preview"></div>' );
      $this.wrap( '<div class="markdown_wrap_editor"></div>' );

      $( '.markdown_wrap_menu_help' ).on('click', function(){
        $( this ).closest( '.markdown_wrap' ).toggleClass( 'helping' );

        $( this ).closest( '.markdown_wrap' ).find( '.markdown_wrap_help' ).slideToggle( 'fast' );
      });

      $( '.markdown_wrap_menu_edit' ).on( 'click', function(){
        //console.log( 'Clicked Edit' );
        $( this ).closest( '.markdown_wrap' ).removeClass( 'previewing' ).addClass( 'editing' );

        $( this ).closest( '.markdown_wrap' ).find( '.markdown_wrap_preview' ).hide();
        $( this ).closest( '.markdown_wrap' ).find( '.markdown_wrap_help' ).hide();
        $( this ).closest( '.markdown_wrap' ).find( '.markdown_wrap_editor' ).show();
      });

      $( '.markdown_wrap_menu_preview' ).on( 'click', function(){
        //console.log( 'Clicked Preview' );
        $( this ).closest( '.markdown_wrap' ).removeClass( 'editing' ).addClass( 'previewing' );

        var editor  = $( this ).closest( '.markdown_wrap' ).find( '.markdown_wrap_editor' );
        var preview = $( this ).closest( '.markdown_wrap' ).find( '.markdown_wrap_preview' );

        preview.html( 'Loading...' );

        editor.hide();
        preview.show();

        var editor_content = editor.find( 'textarea' ).val();

        $.ajax({
          type: 'POST',
          url: '/markdown_preview/convert',
          data: { 'format' : 'json', 'markdown_text' : editor_content },
          success: function( data, textStatus, jqXHR ){
            preview.html( data['html'] );
          },
          error: function(jqXHR, textStatus, errorThrown){
            //console.log( "ERROR" );
            //console.log( jqXHR );
            //console.log( textStatus );
            //console.log( errorThrown );
          },
          dataType: 'text json' 
        });
      });
    });
  };
})( jQuery );

$( document ).ready( function(){
  $( '.markdown_preview' ).markdownPreview();
});

