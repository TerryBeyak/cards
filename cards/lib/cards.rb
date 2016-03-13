# Require core library
require 'middleman-core'

# Extension namespace
class Cards < ::Middleman::Extension

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super

    # Require libraries only when activated
    # require 'necessary/library'

    # set up your extension
    # puts options.my_option
  end

  def after_configuration
    # Do something
  end

  # A Sitemap Manipulator
  # def manipulate_resource_list(resources)
  # end

  helpers do
    def cards cards_array
      cards_output = ""

      cards_array.each do |card|
        cards_output <<"<div class='card'>
                          <div class='card-content #{card.type}'>
                            <p>#{card.title}</p>
                            <img src='#{card.image}' />
                          </div>
                        </div>"
      end

      cards_output
    end
  end
end

# Register extensions which can be activated
# Make sure we have the version of Middleman we expect
# Name param may be omited, it will default to underscored
# version of class name

# MyExtension.register(:my_extension)

::Middleman::Extensions.register(:cards, Cards)
