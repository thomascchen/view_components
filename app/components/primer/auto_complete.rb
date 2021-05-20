# frozen_string_literal: true

module Primer
  # Use `AutoComplete` to provide a user with suggestions that are populated by server search results.
  # @accessibility
  #   Always provide an accessible label for the input field to help the user understand the options provided.
  #   You can show a visible label by setting the `label` slot. This label will be provided for the input field and
  #   the listbox.
  #
  #   To set a non-visible label, set `aria-label` directly on the `input` and `results` slot.
  class AutoComplete < Primer::Component
    status :beta

    DEFAULT_INPUT_TYPE = :text
    INPUT_TYPE_OPTIONS = [DEFAULT_INPUT_TYPE, :search].freeze

    # Set this slot to show a visible label.
    #
    # @param system_arguments [Hash] <%= link_to_system_arguments_docs %>
    renders_one :label, lambda { |id:, **system_arguments|
      @label_id = id
      system_arguments[:tag] = :label
      Primer::BaseComponent.new(id: id, **system_arguments)
    }

    # Required input used to search for results
    #
    # @param type [Symbol] <%= one_of(Primer::AutoComplete::INPUT_TYPE_OPTIONS) %>
    # @param system_arguments [Hash] <%= link_to_system_arguments_docs %>
    renders_one :input, lambda { |type: DEFAULT_INPUT_TYPE, classes: "form-control", **system_arguments|
      system_arguments[:tag] = :input
      system_arguments[:"aria-labelledby"] = @label_id if @label_id.present?

      validate_aria_label(system_arguments) unless system_arguments[:"aria-labelledby"]

      system_arguments[:type] = fetch_or_fallback(INPUT_TYPE_OPTIONS, type, DEFAULT_INPUT_TYPE)
      system_arguments[:classes] = classes
      Primer::BaseComponent.new(**system_arguments)
    }

    # Optional icon to be rendered before the input. Has the same arguments as <%= link_to_component(Primer::OcticonComponent) %>.
    renders_one :icon, Primer::OcticonComponent

    # Customizable results list.
    #
    # @param system_arguments [Hash] <%= link_to_system_arguments_docs %>
    renders_one :results, lambda { |**system_arguments|
      system_arguments[:tag] = :ul
      system_arguments[:id] = @id
      system_arguments[:classes] = class_names(
        "autocomplete-results",
        system_arguments[:classes]
      )
      system_arguments[:"aria-labelledby"] = @label_id if @label_id.present?

      Primer::BaseComponent.new(**system_arguments)
    }

    # @example Default
    #   <%= render(Primer::AutoComplete.new(src: "/auto_complete", id: "fruits-popup", position: :relative)) do |c| %>
    #     <% c.label(id: 'example-1-label').with_content("Fruits") %>
    #     <% c.input(id: 'example-1-input', type: :text, name: "input") %>
    #     <% c.results do %>
    #       <%= render(Primer::AutoComplete::Item.new(selected: true, value: "value")) do |c| %>
    #         Apple
    #       <% end %>
    #       <%= render(Primer::AutoComplete::Item.new(value: "value")) do |c| %>
    #         Orange
    #       <% end %>
    #     <% end %>
    #   <% end %>
    #
    # @example With `aria-label`
    #   <%= render(Primer::AutoComplete.new(src: "/auto_complete", id: "fruits-popup", position: :relative)) do |c| %>
    #     <% c.input(id: 'example-2-input', type: :text, name: "input", "aria-label": "Fruits") %>
    #     <% c.results do %>
    #       <%= render(Primer::AutoComplete::Item.new(selected: true, value: "apple")) do |c| %>
    #         Apple
    #       <% end %>
    #       <%= render(Primer::AutoComplete::Item.new(value: "orange")) do |c| %>
    #         Orange
    #       <% end %>
    #     <% end %>
    #     <% c.results("aria-label": "Fruits") %>
    #   <% end %>
    #
    # @example With custom classes for the results
    #   <%= render(Primer::AutoComplete.new(src: "/auto_complete", id: "fruits-popup", position: :relative)) do |c| %>
    #     <% c.label(id: 'example-label-3').with_content("Fruits") %>
    #     <% c.input(id: 'example-input-3', type: :text, name: "input") %>
    #     <% c.results(classes: "custom-class") do %>
    #       <%= render(Primer::AutoComplete::Item.new(selected: true, value: "apple")) do |c| %>
    #         Apple
    #       <% end %>
    #       <%= render(Primer::AutoComplete::Item.new(value: "orange")) do |c| %>
    #         Orange
    #       <% end %>
    #     <% end %>
    #   <% end %>
    #
    # @example With Icon
    #   <%= render(Primer::AutoComplete.new(src: "/auto_complete", id: "fruits-popup", position: :relative)) do |c| %>
    #     <% c.label(id: 'example-label-4').with_content("Fruits") %>
    #     <% c.input(type: :text, name: "input", id: "example-input-4") %>
    #     <% c.icon(icon: :search) %>
    #     <% c.results do %>
    #       <%= render(Primer::AutoComplete::Item.new(selected: true, value: "apple")) do |c| %>
    #         Apple
    #       <% end %>
    #       <%= render(Primer::AutoComplete::Item.new(value: "orange")) do |c| %>
    #         Orange
    #       <% end %>
    #     <% end %>
    #   <% end %>
    #
    # @param src [String] The route to query.
    # @param id [String] Id of the list element.
    # @param system_arguments [Hash] <%= link_to_system_arguments_docs %>
    def initialize(src:, id:, **system_arguments)
      @id = id
      @system_arguments = system_arguments
      @system_arguments[:tag] = "auto-complete"
      @system_arguments[:src] = src
      @system_arguments[:for] = id
      @system_arguments[:"aria-labelledby"] = @label_id if @label_id.present?
    end

    # add `results` without needing to explicitly call it in the view
    def before_render
      raise ArgumentError, "Missing `input` slot" if input.blank?

      results(classes: "") unless results
    end
  end
end
