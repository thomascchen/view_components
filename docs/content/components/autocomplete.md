---
title: AutoComplete
status: Beta
source: https://github.com/primer/view_components/tree/main/app/components/primer/auto_complete.rb
storybook: https://primer.style/view-components/stories/?path=/story/primer-auto-complete-component
---

import Example from '../../src/@primer/gatsby-theme-doctocat/components/example'
import RequiresJSFlash from '../../src/@primer/gatsby-theme-doctocat/components/requires-js-flash'

<RequiresJSFlash />

<!-- Warning: AUTO-GENERATED file, do not edit. Add code comments to your Ruby instead <3 -->

Use `AutoComplete` to provide a user with suggestions that are populated by server search results.

## Accessibility

Always provide an accessible label for the input field to help the user understand the options provided.
You can show a visible label by setting the `label` slot. This label will be provided for the input field and
the listbox.

To set a non-visible label, set `aria-label` directly on the `input` and `results` slot.

## Examples

### Default

<Example src="<label id='example-1-label' data-view-component='true'>Fruits</label><auto-complete src='/auto_complete' for='fruits-popup' data-view-component='true' class='position-relative'>  <input id='example-1-input' name='input' aria-labelledby='example-1-label' type='text' data-view-component='true' class='form-control'></input>    <ul id='fruits-popup' aria-labelledby='example-1-label' data-view-component='true' class='autocomplete-results'>    <li role='option' data-autocomplete-value='value' aria-selected='true' data-view-component='true' class='autocomplete-item'>      Apple</li>    <li role='option' data-autocomplete-value='value' data-view-component='true' class='autocomplete-item'>      Orange</li></ul></auto-complete>" />

```erb
<%= render(Primer::AutoComplete.new(src: "/auto_complete", id: "fruits-popup", position: :relative)) do |c| %>
  <% c.label(id: 'example-1-label').with_content("Fruits") %>
  <% c.input(id: 'example-1-input', type: :text, name: "input") %>
  <% c.results do %>
    <%= render(Primer::AutoComplete::Item.new(selected: true, value: "value")) do |c| %>
      Apple
    <% end %>
    <%= render(Primer::AutoComplete::Item.new(value: "value")) do |c| %>
      Orange
    <% end %>
  <% end %>
<% end %>
```

### With `aria-label`

<Example src="<auto-complete src='/auto_complete' for='fruits-popup' data-view-component='true' class='position-relative'>  <input id='example-2-input' name='input' aria-label='Fruits' type='text' data-view-component='true' class='form-control'></input>    <ul aria-label='Fruits' id='fruits-popup' data-view-component='true' class='autocomplete-results'></ul></auto-complete>" />

```erb
<%= render(Primer::AutoComplete.new(src: "/auto_complete", id: "fruits-popup", position: :relative)) do |c| %>
  <% c.input(id: 'example-2-input', type: :text, name: "input", "aria-label": "Fruits") %>
  <% c.results do %>
    <%= render(Primer::AutoComplete::Item.new(selected: true, value: "apple")) do |c| %>
      Apple
    <% end %>
    <%= render(Primer::AutoComplete::Item.new(value: "orange")) do |c| %>
      Orange
    <% end %>
  <% end %>
  <% c.results("aria-label": "Fruits") %>
<% end %>
```

### With custom classes for the results

<Example src="<label id='example-label-3' data-view-component='true'>Fruits</label><auto-complete src='/auto_complete' for='fruits-popup' data-view-component='true' class='position-relative'>  <input id='example-input-3' name='input' aria-labelledby='example-label-3' type='text' data-view-component='true' class='form-control'></input>    <ul id='fruits-popup' aria-labelledby='example-label-3' data-view-component='true' class='autocomplete-results my-custom-class'>    <li role='option' data-autocomplete-value='apple' aria-selected='true' data-view-component='true' class='autocomplete-item'>      Apple</li>    <li role='option' data-autocomplete-value='orange' data-view-component='true' class='autocomplete-item'>      Orange</li></ul></auto-complete>" />

```erb
<%= render(Primer::AutoComplete.new(src: "/auto_complete", id: "fruits-popup", position: :relative)) do |c| %>
  <% c.label(id: 'example-label-3').with_content("Fruits") %>
  <% c.input(id: 'example-input-3', type: :text, name: "input") %>
  <% c.results(classes: "my-custom-class") do %>
    <%= render(Primer::AutoComplete::Item.new(selected: true, value: "apple")) do |c| %>
      Apple
    <% end %>
    <%= render(Primer::AutoComplete::Item.new(value: "orange")) do |c| %>
      Orange
    <% end %>
  <% end %>
<% end %>
```

### With Icon

<Example src="<label id='example-label-4' data-view-component='true'>Fruits</label><auto-complete src='/auto_complete' for='fruits-popup' data-view-component='true' class='position-relative'>  <input name='input' id='example-input-4' aria-labelledby='example-label-4' type='text' data-view-component='true' class='form-control'></input>  <svg aria-hidden='true' viewBox='0 0 16 16' version='1.1' data-view-component='true' height='16' width='16' class='octicon octicon-search'>    <path fill-rule='evenodd' d='M11.5 7a4.499 4.499 0 11-8.998 0A4.499 4.499 0 0111.5 7zm-.82 4.74a6 6 0 111.06-1.06l3.04 3.04a.75.75 0 11-1.06 1.06l-3.04-3.04z'></path></svg>  <ul id='fruits-popup' aria-labelledby='example-label-4' data-view-component='true' class='autocomplete-results'>    <li role='option' data-autocomplete-value='apple' aria-selected='true' data-view-component='true' class='autocomplete-item'>      Apple</li>    <li role='option' data-autocomplete-value='orange' data-view-component='true' class='autocomplete-item'>      Orange</li></ul></auto-complete>" />

```erb
<%= render(Primer::AutoComplete.new(src: "/auto_complete", id: "fruits-popup", position: :relative)) do |c| %>
  <% c.label(id: 'example-label-4').with_content("Fruits") %>
  <% c.input(type: :text, name: "input", id: "example-input-4") %>
  <% c.icon(icon: :search) %>
  <% c.results do %>
    <%= render(Primer::AutoComplete::Item.new(selected: true, value: "apple")) do |c| %>
      Apple
    <% end %>
    <%= render(Primer::AutoComplete::Item.new(value: "orange")) do |c| %>
      Orange
    <% end %>
  <% end %>
<% end %>
```

## Arguments

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `src` | `String` | N/A | The route to query. |
| `id` | `String` | N/A | Id of the list element. |
| `system_arguments` | `Hash` | N/A | [System arguments](/system-arguments) |

## Slots

### `Label`

Set this slot to show a visible label.

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `system_arguments` | `Hash` | N/A | [System arguments](/system-arguments) |

### `Input`

Required input used to search for results

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `type` | `Symbol` | N/A | One of `:text` and `:search`. |
| `system_arguments` | `Hash` | N/A | [System arguments](/system-arguments) |

### `Icon`

Optional icon to be rendered before the input. Has the same arguments as [Octicon](/components/octicon).

### `Results`

Customizable results list.

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `system_arguments` | `Hash` | N/A | [System arguments](/system-arguments) |
