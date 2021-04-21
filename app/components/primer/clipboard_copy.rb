# frozen_string_literal: true

def random_string(size = 10)
  ("a".."z").to_a.sample(size).join
end

module Primer
  # Use ClipboardCopy to copy element text content or input values to the clipboard.
  class ClipboardCopy < Primer::Component
    status :alpha

    # Optional icon to show for the element, defaults to a "clippy" icon
    #
    # @param system_arguments [Hash] <%= link_to_system_arguments_docs %>
    renders_one :copy_icon, lambda { |**system_arguments|
      system_arguments[:icon] ||= "clippy"

      Primer::OcticonComponent.new(**system_arguments)
    }

    # Optional icon to show for 2 seconds after the copy icon has been clicked, defaults to a "check" icon.
    #
    # @param system_arguments [Hash] <%= link_to_system_arguments_docs %>
    renders_one :check_icon, lambda { |**system_arguments|
      system_arguments[:icon] ||= "check"
      system_arguments[:style] ||= "display: none;"

      Primer::OcticonComponent.new(**system_arguments)
    }

    # Optional target element that holds the data the user will copy.
    #
    # @param system_arguments [Hash] <%= link_to_system_arguments_docs %>
    renders_one :target, lambda { |**system_arguments|
      system_arguments[:tag] ||= :div
      system_arguments[:id] = @id

      Primer::BaseComponent.new(**system_arguments)
    }

    # @example Default
    #   <%= render(Primer::ClipboardCopy.new(value: "Text to copy")) do %>
    #     "Click to copy!"
    #   <% end %>
    #
    # @example With a target
    #   <%= render(Primer::ClipboardCopy.new(id: "foo")) do |component|
    #     <%= component.target do %>
    #       Text to copy
    #     <% end %>
    #
    #     Click to copy!
    #   <% end %>
    #
    # @example With a form target
    #   <%= render(Primer::ClipboardCopy.new(id: "foo")) do |component|
    #     <%= component.target(tag: :input, value: "Text to copy") %>
    #
    #     Click to copy!
    #   <% end %>
    #
    # @example With a link target
    #   <%= render(Primer::ClipboardCopy.new(id: "foo")) do |component|
    #     <%= component.target(tag: :a, href: "/path/to/copy") %>
    #
    #     Click to copy!
    #   <% end %>
    #
    # @param system_arguments [Hash] <%= link_to_system_arguments_docs %>
    def initialize(**system_arguments)
      @id = system_arguments[:id] || "clipboard-copy-#{random_string(20)}"
      system_arguments[:id] = nil

      @system_arguments = system_arguments
      @system_arguments[:tag] = "clipboard-copy"
      @system_arguments[:for] = @id unless system_arguments[:value]
    end
  end
end
