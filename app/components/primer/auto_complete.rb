# frozen_string_literal: true

module Primer
  # Use `AutoComplete` to provide a user with a list of selectable suggestions that appear when they type into the input field.
  # This list is populated by server search results.
  # @accessibility
  #   Always provide an accessible label to help the user interact with the input element and list.
  #
  #   To show a visible label, set the `label` slot. This renders a `<label>` element which Primer will link
  #   to the correct elements.
  #
  #   If you do not wish to provide a visible label, you must set an `aria-label`. You may set
  #   `aria-label` directly on `AutoComplete` rather than nested slots and Primer will forward it
  #   to the correct elements.
  class AutoComplete < Primer::Component
    status :beta

    DEFAULT_INPUT_TYPE = :text
    INPUT_TYPE_OPTIONS = [DEFAULT_INPUT_TYPE, :search].freeze

    # Optionally render a visible label. See <%= link_to_accessibility %>
    #
    # @param id [Symbol] Allows label to be linked to appropriate elements
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

      if @label_id.present?
        system_arguments[:"aria-labelledby"] = @label_id if @label_id.present?
      else
        system_arguments[:"aria-label"] = system_arguments[:"aria-label"] || system_arguments.dig(:aria, :label) || @aria_label
        raise ArgumentError, "`aria-label` is required." if system_arguments[:"aria-label"].nil? && !Rails.env.production?
      end

      system_arguments[:type] = fetch_or_fallback(INPUT_TYPE_OPTIONS, type, DEFAULT_INPUT_TYPE)
      system_arguments[:classes] = classes
      Primer::BaseComponent.new(**system_arguments)
    }

    # Optional icon to be rendered before the input. Has the same arguments as <%= link_to_component(Primer::OcticonComponent) %>.
    #
    renders_one :icon, Primer::OcticonComponent

    # Customizable results list.
    #
    # @param system_arguments [Hash] <%= link_to_system_arguments_docs %>
    renders_one :results, lambda { |**system_arguments|
      system_arguments[:tag] = :ul
      system_arguments[:id] = @id
      system_arguments[:role] = :listbox
      system_arguments[:classes] = class_names(
        "autocomplete-results",
        system_arguments[:classes]
      )

      if @label_id.present?
        system_arguments[:"aria-labelledby"] = @label_id if @label_id.present?
      else
        system_arguments[:"aria-label"] = system_arguments[:"aria-label"] || system_arguments.dig(:aria, :label) || @aria_label
      end

      Primer::BaseComponent.new(**system_arguments)
    }

    # @example Default
    #   <%= render(Primer::AutoComplete.new(src: "/auto_complete", id: "fruits-popup-1", position: :relative)) do |c| %>
    #     <% c.label(id: 'example-1-label').with_content("Fruits") %>
    #     <% c.input(type: :text, name: "input") %>
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
    #   <%= render(Primer::AutoComplete.new(src: "/auto_complete", id: "fruits-popup-2", position: :relative, "aria-label": "Fruits")) do |c| %>
    #     <% c.input(type: :text, name: "input") %>
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
    # @example With custom classes for the results
    #   <%= render(Primer::AutoComplete.new(src: "/auto_complete", id: "fruits-popup-3", position: :relative)) do |c| %>
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
    #     <% c.input(name: "input", id: "example-input-4") %>
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
      @aria_label = system_arguments[:"aria-label"] || system_arguments.dig(:aria, :label)
      system_arguments.delete(:"aria-label")

      @system_arguments = system_arguments
      @system_arguments[:tag] = "auto-complete"
      @system_arguments[:src] = src
      @system_arguments[:for] = id
    end

    # add `results` without needing to explicitly call it in the view
    def before_render
      raise ArgumentError, "Missing `input` slot" if input.blank?

      results(classes: "") unless results
    end
  end
end
