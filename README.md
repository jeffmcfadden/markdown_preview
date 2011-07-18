# Markdown Preview for Rails

This gem gives you instant markdown preview for any textarea you want, anywhere in your application.

## Installation

## Issues

## Credits



= TinyMCE for Rails

This plugin provides for the installation and utilization of TinyMCE in Ruby on Rails applications of version 2.3.5 and onward.

TinyMCE is a WYSIWYG HTML editing component released under the GNU Lesser General Public License 2.1 (LGPL 2.1) by Moxiecode Systems (http://tinymce.moxiecode.com/).


== Installation

Installing TinyMCE for Rails takes no more than a few minutes to install.

=== Step 1

The recommended installation method for getting tiny_mce working in your application is to use the gem version. To do so, open the console and run:

  [sudo] gem install tiny_mce

Then add this to config/environment.rb of your Rails application:

  config.gem 'tiny_mce'

Alternatively, you can install it as a plugin. To do so, open a console, and in the root of you Rails application, install the plugin by running *one* of the following (depending on the method you use to import plugins):

* script/plugin install git://github.com/kete/tiny_mce.git
* piston import git://github.com/kete/tiny_mce.git vendor/plugins/tiny_mce
* git submodule add git://github.com/kete/tiny_mce.git vendor/plugins/tiny_mce
* Download the latest files ( http://github.com/kete/tiny_mce/tarball/master ) and extract to vendor/plugins/tiny_mce

=== Step 2

Add the following to the top of the controller of the page you want to add TinyMCE to.

  uses_tiny_mce

Then append the following to the text area you want to transform into a TinyMCE editor. You can change the name of the class you want to use by editing the 'editor_selector' param in the controller code options.

  :class => "mceEditor"

Lastly, add the following line(s) to the <head> element of your application view:

  <%= include_tiny_mce_if_needed %>

Now you're all set! Start your server. The gem/plugin will automatically copy the sources to the public javascripts directory when the server is started.


== Configuration

There are several ways to configure the plugin to get the desirable effect you're looking for. The following ways can be combined to create complex tiny mce setups

=== Load Order

A load order is present so that you have finer grained control over what shows up where. The load order currently looks like this. The later ones receive more power, that is, the overwrite similar settings in previous configurations.

1. The default tiny_mce plugin settings. Sets it to work on textareas with class of mceEditor, with the english advanced theme.
2. config/tiny_mce.yml if present. You set your own options here, used across all editors on the site.
3. uses_tiny_mce declaration. You set you own options here, used across all editors in the controller.
4. include_tiny_mce_if_needed declaration. You set your own options here, used across all editors contained within that layout.

Below, I'll cover how to use #2, and #3, which are the most likely ones you'll want to use.

=== Global Options

If you have a set of default options that is used throughout all editors in your application, you might want to make them global. You can do this by putting your settings into config/tiny_mce.yml. If the file exists, the tiny_mce plugin will parse the options in it first.

==== Example

  theme: advanced
  plugins:
  - table
  - fullscreen

=== TinyMCE options

You can change the theme, order/choice of buttons, selectors Id, plugins, and many more by passing an :options hash to the uses_tiny_mce declaration.

The options hash can contain any number of settings available in lib/tiny_mce/valid_tinymce_options.yml  (a copy of the settings available per version).

If an option is misspelled, invalid, or deprecated (no longer in TinyMCE), when you go to a page containing your editor, you will receive an Exception, which must be dealt with before continuing.

You can read about all these options at http://tinymce.moxiecode.com/documentation.php

==== Example

  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :plugins => %w{ table fullscreen }
                            }

=== Filter options

If, like most applications, you only need the editor on the new, create, edit, and update pages, then tell the uses_tiny_mce declaration this, so it doesn't load up all the files unnecessarily.

The declaration accepts any number of default parameters a normal controller filter would.

==== Example

  uses_tiny_mce :only => [:new, :create, :edit, :update]


=== Additional Javascript options

Sometimes, when you need complex arrays of data for plugins or such, the plugin helpers aren't complex enough to do what you need. But you can always fall back to supplying your own options. You can this by passing a raw javascript (no <script> tags) to the uses_tiny_mce declaration. Consider the following example for the template plugin.

  uses_tiny_mce :raw_options => "template_templates : [ {
                                                          title : 'Editor Details',
                                                          src : 'editor_details.htm',
                                                          description : 'Adds Editors Name and Staff ID'
                                                      } ]"


== Methods

TinyMCE has a range of convenience methods for loading TinyMCE. Besides the uses_tiny_mce shown above, they include:

  using_tiny_mce?
      Check whether the uses_tiny_mce declaration has been made in the current controller

  raw_tiny_mce_init
      Creates a string of javascript formed from the options declared to uses_tiny_mce (is not wrapped in a JS tag though, use tiny_mce_init for that)

  tiny_mce_init
      Creates a javascript tag formed from the options declared to uses_tiny_mce (executes whether uses_tiny_mce was declared or not)
  tiny_mce_init_if_needed
      Creates a javascript tag formed from the options declared to uses_tiny_mce (executes only when uses_tiny_mce has been declared)

  include_tiny_mce_js
      Includes the TinyMCE core javascript file, must be declared before tiny_mce_init (executes whether uses_tiny_mce was declared or not)
  include_tiny_mce_js_if_needed
      Includes the TinyMCE core javascript file, must be declared before tiny_mce_init (executes only when uses_tiny_mce has been declared)

  include_tiny_mce_if_needed
      Includes the TinyMCE core javascript file, and creates a string of javascript formed from the options declared to uses_tiny_mce (executes only when uses_tiny_mce has been declared)


== Spellchecking

See SPELLCHECKING_PLUGIN.rdoc . Note: Spell checking is not tested o regularly maintained. Use with caution.

http://github.com/kete/tiny_mce/tree/master/SPELLCHECKING_PLUGIN.rdoc


== Testing

The plugin comes with a test suite that can be run once the plugin is installed in an application.

Change into the plugins directory and run 'rake' to start them.

Note: The tests require Rails 2.2 or higher, and are currently tested on Rails 2.3 (so problems in older versions may arise - please see "Reporting an Issue" if they do)


== Reporting an Issue

If you have a problem, please report it on the tiny_mce plugin ticket tracker (on Ligthouseapp)

http://kete.lighthouseapp.com/projects/14744-tiny_mce/tickets

Be sure to include Rails version, plugin version, and when possible, a sample application that can reproduce the problem. Upload it to one of the various file hosting sites and link to it in the ticket. Don't include vendored rails or the tiny_mce plugin in the archive (if I know the versions, I'll add these myself).


== Contributing

If you've added something, why not share it. Fork the repository (http://github.com/kete/tiny_mce), make the changes and send a pull request to the maintainers.

Changes with tests, and full documentation are preferred.


= Credits

This plugin was created by Blake Watters <blake@near-time.com>

This plugin is currently maintained by Kieran Pilkington <kieran@katipo.co.nz>

Bundled TinyMCE version: 3.3.6
