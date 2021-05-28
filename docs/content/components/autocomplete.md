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

Use `AutoComplete` to provide a user with a list of selectable suggestions that appear when they type into the
input field. This list is populated by server search results.

## Accessibility

Always provide an accessible label to help the user interact with the input element and listbox popup.

To show a visible label, set the `label` slot. The`for` attribute must be set to the `id` of
`input` in order for the `<label>` to be properly linked.

If you do not wish to provide a visible label, you must set an `aria-label` attribute. You may set
`:"aria-label"` directly on `AutoComplete` instead of the slots and Primer will apply it to the correct elements.

## Examples

### Default

<Example src="<label for='example-input' data-view-component='true'>Fruits</label><auto-complete src='/auto_complete' for='fruits-popup-1' data-view-component='true' class='position-relative'>  <input id='example-input' name='input' aria-label='false' type='text' data-view-component='true' class='form-control'></input>    <ul id='fruits-popup-1' data-view-component='true' class='autocomplete-results'></ul></auto-complete>" />

```erb
<%= render(Primer::AutoComplete.new(src: "/auto_complete", id: "fruits-popup-1", position: :relative)) do |c| %>
  <% c.label(for: "example-input").with_content("Fruits") %>
  <% c.input(id: "example-input", type: :text, name: "input") %>
<% end %>
```

### With `aria-label`

