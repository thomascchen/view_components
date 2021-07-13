# frozen_string_literal: true

module Primer
  # Use `UnderlineNav` to style page links as tabs with an underlined selected state.
  class UnderlineNav < Primer::Component
    include Primer::TabbedComponentHelper
    include Primer::UnderlineNavHelper

    TAG_DEFAULT = :nav
    TAG_OPTIONS = [:div, TAG_DEFAULT].freeze

    # Use tab to render a link.
    # See <%= link_to_component(Primer::Navigation::TabComponent) %>.
    #
    # @param selected [Boolean] Whether the tab is selected.
    # @param href [String] URL to be used for the Link.
    # @param system_arguments [Hash] <%= link_to_system_arguments_docs %>
    renders_many :tabs, lambda { |selected: false, **system_arguments|
      system_arguments[:classes] = underline_nav_tab_classes(system_arguments[:classes])

      Primer::Navigation::TabComponent.new(
        selected: selected,
        icon_classes: "UnderlineNav-octicon",
        **system_arguments
      )
    }

    # Use actions for a call to action.
    #
    # @param tag [Symbol] (Primer::UnderlineNav::ACTIONS_TAG_DEFAULT) <%= one_of(Primer::UnderlineNav::ACTIONS_TAG_OPTIONS) %>
    # @param system_arguments [Hash] <%= link_to_system_arguments_docs %>
    renders_one :actions, lambda { |tag: ACTIONS_TAG_DEFAULT, **system_arguments|
      system_arguments[:tag] = fetch_or_fallback(ACTIONS_TAG_OPTIONS, tag, ACTIONS_TAG_DEFAULT)
      system_arguments[:classes] = underline_nav_action_classes(system_arguments[:classes])

      Primer::BaseComponent.new(**system_arguments)
    }

    # @example Default
    #   <%= render(Primer::UnderlineNav.new(label: "Default")) do |component| %>
    #     <% component.tab(href: "#", selected: true) { "Item 1" } %>
    #     <% component.tab(href: "#") { "Item 2" } %>
    #     <% component.actions do %>
    #       <%= render(Primer::ButtonComponent.new) { "Button!" } %>
    #     <% end %>
    #   <% end %>
    #
    # @example With icons and counters
    #   <%= render(Primer::UnderlineNav.new(label: "With icons and counters")) do |component| %>
    #     <% component.tab(href: "#", selected: true) do |t| %>
    #       <% t.icon(icon: :star) %>
    #       <% t.text { "Item 1" } %>
    #     <% end %>
    #     <% component.tab(href: "#") do |t| %>
    #       <% t.icon(icon: :star) %>
    #       <% t.text { "Item 2" } %>
    #       <% t.counter(count: 10) %>
    #     <% end %>
    #     <% component.tab(href: "#") do |t| %>
    #       <% t.text { "Item 3" } %>
    #       <% t.counter(count: 10) %>
    #     <% end %>
    #     <% component.actions do %>
    #       <%= render(Primer::ButtonComponent.new) { "Button!" } %>
    #     <% end %>
    #   <% end %>
    #
    # @example Align right
    #   <%= render(Primer::UnderlineNav.new(label: "Align right", align: :right)) do |component| %>
    #     <% component.tab(href: "#", selected: true) do |t| %>
    #       <% t.text { "Item 1" } %>
    #     <% end %>
    #     <% component.tab(href: "#") do |t| %>
    #       <% t.text { "Item 2" } %>
    #     <% end %>
    #     <% component.actions do %>
    #       <%= render(Primer::ButtonComponent.new) { "Button!" } %>
    #     <% end %>
    #   <% end %>
    #
    # @example Customizing the body
    #   <%= render(Primer::UnderlineNav.new(label: "Default", body_arguments: { classes: "custom-class", border: true, border_color: :info })) do |c| %>
    #     <% c.tab(selected: true, href: "#") { "Tab 1" }%>
    #     <% c.tab(href: "#") { "Tab 2" } %>
    #     <% c.tab(href: "#") { "Tab 3" } %>
    #   <% end %>
    #
    # @param tag [Symbol] <%= one_of(Primer::UnderlineNav::TAG_OPTIONS) %>
    # @param label [String] Used to set the `aria-label` on top level element.
    # @param align [Symbol] <%= one_of(Primer::UnderlineNavHelper::ALIGN_OPTIONS) %> - Defaults to <%= Primer::UnderlineNavHelper::ALIGN_DEFAULT %>
    # @param body_arguments [Hash] <%= link_to_system_arguments_docs %> for the body wrapper.
    # @param system_arguments [Hash] <%= link_to_system_arguments_docs %>
    def initialize(label:, tag: TAG_DEFAULT, align: ALIGN_DEFAULT, body_arguments: {}, **system_arguments)
      @align = fetch_or_fallback(ALIGN_OPTIONS, align, ALIGN_DEFAULT)

      @system_arguments = system_arguments
      @system_arguments[:tag] = fetch_or_fallback(TAG_OPTIONS, tag, TAG_DEFAULT)
      @system_arguments[:classes] = underline_nav_classes(@system_arguments[:classes], @align)
    
      @body_arguments = body_arguments
      @body_arguments[:tag] = :ul
      @body_arguments[:classes] = underline_nav_body_classes(@body_arguments[:classes])

      @system_arguments[:"aria-label"] = label
    end

    private

    def body
      Primer::BaseComponent.new(**@body_arguments)
    end
  end
end
