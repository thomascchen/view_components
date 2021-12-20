---
title: Sticker sheet
---

## [AutoComplete](/components/beta/autocomplete)

Use `AutoComplete` to provide a user with a list of selectable suggestions that appear when they type into the
input field. This list is populated by server search results.

<Example src="<label for='fruits-input-1' data-view-component='true'>Fruits</label><auto-complete src='/auto_complete' for='fruits-popup-1' data-view-component='true' class='position-relative'>  <input id='fruits-input-1' name='fruits-input-1' type='text' data-view-component='true' class='form-control' />    <ul id='fruits-popup-1' data-view-component='true' class='autocomplete-results'></ul></auto-complete>" />

```erb
<%= render(Primer::Beta::AutoComplete.new(src: "/auto_complete", input_id: "fruits-input-1", list_id: "fruits-popup-1", position: :relative)) do |c| %>
  <% c.label(classes:"").with_content("Fruits") %>
  <% c.input(type: :text) %>
<% end %>
```
## [AutoCompleteItem](/components/beta/autocompleteitem)

Use `AutoCompleteItem` to list results of an auto-completed search.

<Example src="<li role='option' data-autocomplete-value='value' aria-selected='true' data-view-component='true' class='autocomplete-item'>  Selected</li><li role='option' data-autocomplete-value='value' data-view-component='true' class='autocomplete-item'>  Not selected</li>" />

```erb
<%= render(Primer::Beta::AutoComplete::Item.new(selected: true, value: "value")) do |c| %>
  Selected
<% end %>
<%= render(Primer::Beta::AutoComplete::Item.new(value: "value")) do |c| %>
  Not selected
<% end %>
```
## [Avatar](/components/beta/avatar)

`Avatar` can be used to represent users and organizations on GitHub.

- Use the default circle avatar for users, and the square shape
for organizations or any other non-human avatars.
- By default, `Avatar` will render a static `<img>`. To have `Avatar` function as a link, set the `href` which will wrap the `<img>` in a `<a>`.
- Set `size` to update the height and width of the `Avatar` in pixels.
- To stack multiple avatars together, use [AvatarStack](/components/beta/avatarstack).

<Example src="<img src='http://placekitten.com/200/200' alt='@kittenuser' size='20' height='20' width='20' data-view-component='true' class='avatar avatar-small circle' />" />

```erb
<%= render(Primer::Beta::Avatar.new(src: "http://placekitten.com/200/200", alt: "@kittenuser")) %>
```
## [AvatarStack](/components/beta/avatarstack)

Use `AvatarStack` to stack multiple avatars together.

<Example src="<div data-view-component='true' class='AvatarStack AvatarStack--three-plus'>  <div data-view-component='true' class='AvatarStack-body'>      <img src='http://placekitten.com/200/200' alt='@kittenuser' size='20' height='20' width='20' data-view-component='true' class='avatar avatar-small circle' />      <img src='http://placekitten.com/200/200' alt='@kittenuser' size='20' height='20' width='20' data-view-component='true' class='avatar avatar-small circle' />        <div class='avatar avatar-more'></div>      <img src='http://placekitten.com/200/200' alt='@kittenuser' size='20' height='20' width='20' data-view-component='true' class='avatar avatar-small circle' /></div></div>" />

```erb
<%= render(Primer::Beta::AvatarStack.new) do |c| %>
  <% c.avatar(src: "http://placekitten.com/200/200", alt: "@kittenuser") %>
  <% c.avatar(src: "http://placekitten.com/200/200", alt: "@kittenuser") %>
  <% c.avatar(src: "http://placekitten.com/200/200", alt: "@kittenuser") %>
<% end  %>
```
## [BaseButton](/components/basebutton)

Use `BaseButton` to render an unstyled `<button>` tag that can be customized.

<Example src="<button type='button' data-view-component='true' class='btn-block'>Block</button><button scheme='primary' type='button' data-view-component='true' class='btn-block'>Primary block</button>" />

```erb
<%= render(Primer::BaseButton.new(block: :true)) { "Block" } %>
<%= render(Primer::BaseButton.new(block: :true, scheme: :primary)) { "Primary block" } %>
```
## [Blankslate](/components/beta/blankslate)

Use `Blankslate` when there is a lack of content within a page or section. Use as placeholder to tell users why something isn't there.

<Example src="  <div data-view-component='true' class='blankslate'>        <h2 data-view-component='true' class='h2 mb-1'>Title</h2>    <div data-view-component='true'>Description</div>    </div>" />

```erb
<%= render Primer::Beta::Blankslate.new do |c| %>
  <% c.heading(tag: :h2).with_content("Title") %>
  <% c.description { "Description"} %>
<% end %>
```
## [BorderBox](/components/borderbox)

`BorderBox` is a Box component with a border.

<Example src="<div data-view-component='true' class='Box'>  <div data-view-component='true' class='Box-header'>  <h2 data-view-component='true' class='Box-title'>      Header</h2>  </div>  <div data-view-component='true' class='Box-body'>    Body</div>    <ul>        <li data-view-component='true' class='Box-row'>      Row one</li>        <li data-view-component='true' class='Box-row'>    Row two</li>    </ul>  <div data-view-component='true' class='Box-footer'>    Footer</div></div>" />

```erb
<%= render(Primer::BorderBoxComponent.new) do |component| %>
  <% component.header do |h| %>
    <% h.title(tag: :h2) do %>
      Header
    <% end %>
  <% end %>
  <% component.body do %>
    Body
  <% end %>
  <% component.row do %>
    <% if true %>
      Row one
    <% end %>
  <% end %>
  <% component.row do %>
    Row two
  <% end %>
  <% component.footer do %>
    Footer
  <% end %>
<% end %>
```
## [BorderBoxHeader](/components/alpha/borderboxheader)

`BorderBox::Header` is used inside `BorderBox` to render its header slot.

<Example src="<div data-view-component='true' class='Box-header'>      Header</div>" />

```erb

<%= render(Primer::Alpha::BorderBox::Header.new) do %>
  Header
<% end %>
```
## [Box](/components/box)

`Box` is a basic wrapper component for most layout related needs.

<Example src="<div data-view-component='true'>Your content here</div>" />

```erb
<%= render(Primer::BoxComponent.new) { "Your content here" } %>
```
## [Breadcrumbs](/components/beta/breadcrumbs)

Use `Breadcrumbs` to display page hierarchy.

#### Known issues

##### Responsiveness

`Breadcrumbs` is not optimized for responsive designs.

<Example src="<nav aria-label='Breadcrumb' data-view-component='true'>  <ol>      <li data-view-component='true' class='breadcrumb-item '><a href='/' data-view-component='true'>Home</a></li>      <li data-view-component='true' class='breadcrumb-item '><a href='/about' data-view-component='true'>About</a></li>      <li data-view-component='true' class='breadcrumb-item  breadcrumb-item-selected'><a aria-current='page' href='/about/team' data-view-component='true'>Team</a></li>  </ol></nav>" />

```erb
<%= render(Primer::Beta::Breadcrumbs.new) do |component| %>
  <% component.item(href: "/") do %>Home<% end %>
  <% component.item(href: "/about") do %>About<% end %>
  <% component.item(href: "/about/team") do %>Team<% end %>
<% end %>
```
## [Button](/components/button)

Use `Button` for actions (e.g. in forms). Use links for destinations, or moving from one page to another.

<Example src="<button type='button' data-view-component='true' class='btn'>  Default</button><button type='button' data-view-component='true' class='btn-primary btn'>  Primary</button><button type='button' data-view-component='true' class='btn-danger btn'>  Danger</button><button type='button' data-view-component='true' class='btn-outline btn'>  Outline</button><button type='button' data-view-component='true' class='btn-invisible btn'>  Invisible</button><button type='button' data-view-component='true' class='btn-link'>  Link</button>" />

```erb
<%= render(Primer::ButtonComponent.new) { "Default" } %>
<%= render(Primer::ButtonComponent.new(scheme: :primary)) { "Primary" } %>
<%= render(Primer::ButtonComponent.new(scheme: :danger)) { "Danger" } %>
<%= render(Primer::ButtonComponent.new(scheme: :outline)) { "Outline" } %>
<%= render(Primer::ButtonComponent.new(scheme: :invisible)) { "Invisible" } %>
<%= render(Primer::ButtonComponent.new(scheme: :link)) { "Link" } %>
```
## [ButtonGroup](/components/buttongroup)

Use `ButtonGroup` to render a series of buttons.

<Example src="<div data-view-component='true' class='BtnGroup'>    <button type='button' data-view-component='true' class='btn BtnGroup-item'>  Default</button>    <button type='button' data-view-component='true' class='btn-primary btn BtnGroup-item'>  Primary</button>    <button type='button' data-view-component='true' class='btn-danger btn BtnGroup-item'>  Danger</button>    <button type='button' data-view-component='true' class='btn-outline btn BtnGroup-item'>  Outline</button>    <button type='button' data-view-component='true' class='custom-class btn BtnGroup-item'>  Custom class</button></div>" />

```erb

<%= render(Primer::ButtonGroup.new) do |component| %>
  <% component.button { "Default" } %>
  <% component.button(scheme: :primary) { "Primary" } %>
  <% component.button(scheme: :danger) { "Danger" } %>
  <% component.button(scheme: :outline) { "Outline" } %>
  <% component.button(classes: "custom-class") { "Custom class" } %>
<% end %>
```
## [ButtonMarketing](/components/alpha/buttonmarketing)

Use `ButtonMarketing` for actions (e.g. in forms). Use links for destinations, or moving from one page to another.

<Example src="<button type='button' data-view-component='true' class='btn-mktg mr-2'>Default</button><button type='button' data-view-component='true' class='btn-mktg btn-signup-mktg mr-2'>Primary</button><button type='button' data-view-component='true' class='btn-mktg btn-muted-mktg'>Outline</button><div class='color-bg-emphasis'>  <button type='button' data-view-component='true' class='btn-mktg btn-subtle-mktg'>Transparent</button></div>" />

```erb
<%= render(Primer::Alpha::ButtonMarketing.new(mr: 2)) { "Default" } %>
<%= render(Primer::Alpha::ButtonMarketing.new(scheme: :primary, mr: 2)) { "Primary" } %>
<%= render(Primer::Alpha::ButtonMarketing.new(scheme: :outline)) { "Outline" } %>
<div class="color-bg-emphasis">
  <%= render(Primer::Alpha::ButtonMarketing.new(scheme: :transparent)) { "Transparent" } %>
</div>
```
## [ClipboardCopy](/components/clipboardcopy)

Use `ClipboardCopy` to copy element text content or input values to the clipboard.

<Example src="<clipboard-copy aria-label='Copy text to the system clipboard' value='Text to copy' data-view-component='true'>    <svg aria-hidden='true' height='16' viewBox='0 0 16 16' version='1.1' width='16' data-view-component='true' class='octicon octicon-copy'>    <path fill-rule='evenodd' d='M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 010 1.5h-1.5a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-1.5a.75.75 0 011.5 0v1.5A1.75 1.75 0 019.25 16h-7.5A1.75 1.75 0 010 14.25v-7.5z'></path><path fill-rule='evenodd' d='M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0114.25 11h-7.5A1.75 1.75 0 015 9.25v-7.5zm1.75-.25a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-7.5a.25.25 0 00-.25-.25h-7.5z'></path></svg>    <svg style='display: none;' aria-hidden='true' height='16' viewBox='0 0 16 16' version='1.1' width='16' data-view-component='true' class='octicon octicon-check color-fg-success'>    <path fill-rule='evenodd' d='M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z'></path></svg></clipboard-copy>" />

```erb
<%= render(Primer::ClipboardCopy.new(value: "Text to copy", "aria-label": "Copy text to the system clipboard")) %>
```
## [CloseButton](/components/closebutton)

Use `CloseButton` to render an `×` without default button styles.

[0]: https://primer.style/view-components/system-arguments#html-attributes

<Example src="<button aria-label='Close' type='button' data-view-component='true' class='close-button'><svg aria-hidden='true' height='16' viewBox='0 0 16 16' version='1.1' width='16' data-view-component='true' class='octicon octicon-x'>    <path fill-rule='evenodd' d='M3.72 3.72a.75.75 0 011.06 0L8 6.94l3.22-3.22a.75.75 0 111.06 1.06L9.06 8l3.22 3.22a.75.75 0 11-1.06 1.06L8 9.06l-3.22 3.22a.75.75 0 01-1.06-1.06L6.94 8 3.72 4.78a.75.75 0 010-1.06z'></path></svg></button>" />

```erb
<%= render(Primer::CloseButton.new) %>
```
## [Counter](/components/counter)

Use `Counter` to add a count to navigational elements and buttons.

<Example src="<span title='25' data-view-component='true' class='Counter'>25</span>" />

```erb
<%= render(Primer::CounterComponent.new(count: 25)) %>
```
## [Details](/components/details)

Use `DetailsComponent` to reveal content after clicking a button.

<Example src="<details data-view-component='true'>  <summary role='button' data-view-component='true' class='btn'>  Summary</summary>  <div data-view-component='true'>    Body</div></details>" />

```erb

<%= render Primer::DetailsComponent.new do |c| %>
  <% c.summary do %>
    Summary
  <% end %>
  <% c.body do %>
    Body
  <% end %>
<% end %>
```
## [Dropdown](/components/dropdown)

`Dropdown` is a lightweight context menu for housing navigation and actions.
They're great for instances where you don't need the full power (and code) of the SelectMenu.

<Example src="<details data-view-component='true' class='dropdown details-overlay details-reset'>  <summary role='button' data-view-component='true' class='btn'>  Dropdown</summary>  <div data-view-component='true'>    <details-menu role='menu' data-view-component='true' class='dropdown-menu dropdown-menu-se'>    <div class='dropdown-header'>      Options    </div>      <a role='menuitem' data-view-component='true' class='dropdown-item'>Item 1</a>      <a role='menuitem' data-view-component='true' class='dropdown-item'>Item 2</a>      <a role='menuitem' data-view-component='true' class='dropdown-item'>Item 3</a></details-menu></div></details>" />

```erb
<%= render(Primer::Dropdown.new) do |c| %>
  <% c.button do %>
    Dropdown
  <% end %>

  <% c.menu(header: "Options") do |menu|
    menu.item { "Item 1" }
    menu.item { "Item 2" }
    menu.item { "Item 3" }
  end %>
<% end %>
```
## [DropdownMenu](/components/dropdownmenu)

DropdownMenus are lightweight context menus for housing navigation and actions.
They're great for instances where you don't need the full power (and code)
of the select menu.

<Example src="<div>  <details data-view-component='true' class='details-overlay details-reset position-relative'>  <summary role='button' data-view-component='true' class='btn'>  Dropdown</summary>  <div data-view-component='true'>      <details-menu role='menu' data-view-component='true' class='dropdown-menu dropdown-menu-se'>    <div class='dropdown-header'>      Options    </div>          <ul>          <li><a class='dropdown-item' href='#url'>Dropdown item</a></li>          <li><a class='dropdown-item' href='#url'>Dropdown item</a></li>          <li><a class='dropdown-item' href='#url'>Dropdown item</a></li>        </ul></details-menu></div></details></div>" />

```erb
<div>
  <%= render(Primer::DetailsComponent.new(overlay: :default, reset: true, position: :relative)) do |c| %>
    <% c.summary do %>
      Dropdown
    <% end %>

    <% c.body do %>
      <%= render(Primer::DropdownMenuComponent.new(header: "Options")) do %>
        <ul>
          <li><a class="dropdown-item" href="#url">Dropdown item</a></li>
          <li><a class="dropdown-item" href="#url">Dropdown item</a></li>
          <li><a class="dropdown-item" href="#url">Dropdown item</a></li>
        </ul>
      <% end %>
    <% end %>
  <% end %>
</div>
```
## [Flash](/components/flash)

Use `Flash` to inform users of successful or pending actions.

<Example src="<div data-view-component='true' class='flash'>    This is a flash message!  </div><div data-view-component='true' class='flash flash-warn'>    This is a warning flash message!  </div><div data-view-component='true' class='flash flash-error'>    This is a danger flash message!  </div><div data-view-component='true' class='flash flash-success'>    This is a success flash message!  </div>" />

```erb
<%= render(Primer::FlashComponent.new) { "This is a flash message!" } %>
<%= render(Primer::FlashComponent.new(scheme: :warning)) { "This is a warning flash message!" } %>
<%= render(Primer::FlashComponent.new(scheme: :danger)) { "This is a danger flash message!" } %>
<%= render(Primer::FlashComponent.new(scheme: :success)) { "This is a success flash message!" } %>
```
## [Flex](/components/flex)

Use `Flex` to make an element lay out its content using the flexbox model.
Before using these utilities, you should be familiar with CSS3 Flexible Box
spec. If you are not, check out MDN's guide  [Using CSS Flexible
Boxes](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox).

<Example src="<div data-view-component='true' class='color-bg-subtle d-flex'>  <div data-view-component='true' class='border p-5 color-bg-subtle'>Item 1</div>  <div data-view-component='true' class='border p-5 color-bg-subtle'>Item 2</div>  <div data-view-component='true' class='border p-5 color-bg-subtle'>Item 3</div></div>" />

```erb
<%= render(Primer::FlexComponent.new(bg: :subtle)) do %>
  <%= render(Primer::BoxComponent.new(p: 5, bg: :subtle, classes: "border")) { "Item 1" } %>
  <%= render(Primer::BoxComponent.new(p: 5, bg: :subtle, classes: "border")) { "Item 2" } %>
  <%= render(Primer::BoxComponent.new(p: 5, bg: :subtle, classes: "border")) { "Item 3" } %>
<% end %>
```
## [FlexItem](/components/flexitem)

Use `FlexItem` to specify the ability of a flex item to alter its
dimensions to fill available space.

<Example src="<div data-view-component='true' class='d-flex'>  <div data-view-component='true'>    Item 1</div>  <div data-view-component='true' class='flex-auto'>    Item 2</div></div>" />

```erb
<%= render(Primer::FlexComponent.new) do %>
  <%= render(Primer::FlexItemComponent.new) do %>
    Item 1
  <% end %>

  <%= render(Primer::FlexItemComponent.new(flex_auto: true)) do %>
    Item 2
  <% end %>
<% end %>
```
## [Heading](/components/heading)

`Heading` should be used to communicate page organization and hierarchy.

- Set tag to one of `:h1`, `:h2`, `:h3`, `:h4`, `:h5`, `:h6` based on what is appropriate for the page context.
- Use `Heading` as the title of a section or sub section.
- Do not use `Heading` for styling alone. For simply styling text, consider using [Text](/components/beta/text) with relevant [Typography](/system-arguments#typography)
  such as `font_size` and `font_weight`.
- Do not jump heading levels. For instance, do not follow a `<h1>` with an `<h3>`. Heading levels should increase by one in ascending order.

<Example src="<h1 data-view-component='true'>H1 Text</h1><h2 data-view-component='true'>H2 Text</h2><h3 data-view-component='true'>H3 Text</h3><h4 data-view-component='true'>H4 Text</h4><h5 data-view-component='true'>H5 Text</h5><h6 data-view-component='true'>H6 Text</h6>" />

```erb
<%= render(Primer::HeadingComponent.new(tag: :h1)) { "H1 Text" } %>
<%= render(Primer::HeadingComponent.new(tag: :h2)) { "H2 Text" } %>
<%= render(Primer::HeadingComponent.new(tag: :h3)) { "H3 Text" } %>
<%= render(Primer::HeadingComponent.new(tag: :h4)) { "H4 Text" } %>
<%= render(Primer::HeadingComponent.new(tag: :h5)) { "H5 Text" } %>
<%= render(Primer::HeadingComponent.new(tag: :h6)) { "H6 Text" } %>
```
## [HellipButton](/components/hellipbutton)

Use `HellipButton` to render a button with a hellip. Often used for hidden text expanders.

<Example src="<button aria-label='No effect' aria-expanded='false' type='button' data-view-component='true'>&hellip;</button>" />

```erb
<%= render(Primer::HellipButton.new("aria-label": "No effect")) %>
```
## [HiddenTextExpander](/components/hiddentextexpander)

Use `HiddenTextExpander` to indicate and toggle hidden text.

<Example src="<span aria-label='No effect' data-view-component='true' class='hidden-text-expander'><button aria-label='No effect' aria-expanded='false' type='button' data-view-component='true' class='ellipsis-expander'>&hellip;</button></span>" />

```erb
<%= render(Primer::HiddenTextExpander.new("aria-label": "No effect")) %>
```
## [IconButton](/components/iconbutton)

Use `IconButton` to render Icon-only buttons without the default button styles.

<Example src="<button aria-label='Search' type='button' data-view-component='true' class='btn-octicon'><svg aria-hidden='true' height='16' viewBox='0 0 16 16' version='1.1' width='16' data-view-component='true' class='octicon octicon-search'>    <path fill-rule='evenodd' d='M11.5 7a4.499 4.499 0 11-8.998 0A4.499 4.499 0 0111.5 7zm-.82 4.74a6 6 0 111.06-1.06l3.04 3.04a.75.75 0 11-1.06 1.06l-3.04-3.04z'></path></svg></button>" />

```erb

<%= render(Primer::IconButton.new(icon: :search, "aria-label": "Search")) %>
```
## [Image](/components/image)

Use `Image` to render images.

<Example src="<img src='https://github.com/github.png' alt='GitHub' data-view-component='true' />" />

```erb

<%= render(Primer::Image.new(src: "https://github.com/github.png", alt: "GitHub")) %>
```
## [ImageCrop](/components/imagecrop)

A client-side mechanism to crop images.

<Example src="<image-crop src='https://github.com/koddsson.png' rounded='true' data-view-component='true'>    <svg data-loading-slot='true' style='box-sizing: content-box; color: var(--color-icon-primary);' width='64' height='64' viewBox='0 0 16 16' fill='none' data-view-component='true' class='flex-1 anim-rotate'>  <circle cx='8' cy='8' r='7' stroke='currentColor' stroke-opacity='0.25' stroke-width='2' vector-effect='non-scaling-stroke' />  <path d='M15 8a7.002 7.002 0 00-7-7' stroke='currentColor' stroke-width='2' stroke-linecap='round' vector-effect='non-scaling-stroke' /></svg>  <input autocomplete='off' type='hidden' data-image-crop-input='x' name='cropped_x'>  <input autocomplete='off' type='hidden' data-image-crop-input='y' name='cropped_y'>  <input autocomplete='off' type='hidden' data-image-crop-input='width' name='cropped_width'>  <input autocomplete='off' type='hidden' data-image-crop-input='height' name='cropped_height'></image-crop>" />

```erb
<%= render(Primer::ImageCrop.new(src: "https://github.com/koddsson.png")) %>
```
## [Label](/components/label)

Use `Label` to add contextual metadata to a design.

<Example src="<span data-view-component='true' class='Label'>Default</span><span data-view-component='true' class='Label Label--primary'>Primary</span><span data-view-component='true' class='Label Label--secondary'>Secondary</span><span data-view-component='true' class='Label Label--accent'>Accent</span><span data-view-component='true' class='Label Label--success'>Success</span><span data-view-component='true' class='Label Label--attention'>Attention</span><span data-view-component='true' class='Label Label--danger'>Danger</span><span data-view-component='true' class='Label Label--severe'>Severe</span><span data-view-component='true' class='Label Label--done'>Done</span><span data-view-component='true' class='Label Label--sponsors'>Sponsors</span>" />

```erb
<%= render(Primer::LabelComponent.new) { "Default" } %>
<%= render(Primer::LabelComponent.new(scheme: :primary)) { "Primary" } %>
<%= render(Primer::LabelComponent.new(scheme: :secondary)) { "Secondary" } %>
<%= render(Primer::LabelComponent.new(scheme: :accent)) { "Accent" } %>
<%= render(Primer::LabelComponent.new(scheme: :success)) { "Success" } %>
<%= render(Primer::LabelComponent.new(scheme: :attention)) { "Attention" } %>
<%= render(Primer::LabelComponent.new(scheme: :danger)) { "Danger" } %>
<%= render(Primer::LabelComponent.new(scheme: :severe)) { "Severe" } %>
<%= render(Primer::LabelComponent.new(scheme: :done)) { "Done" } %>
<%= render(Primer::LabelComponent.new(scheme: :sponsors)) { "Sponsors" } %>
```
## [Layout](/components/alpha/layout)

`Layout` provides foundational patterns for responsive pages.
`Layout` can be used for simple two-column pages, or it can be nested to provide flexible 3-column experiences.
 On smaller screens, `Layout` uses vertically stacked rows to display content.

`Layout` flows as both column, when there's enough horizontal space to render both `Main` and `Sidebar`side-by-side (on a desktop of tablet device, per instance);
or it flows as a row, when `Main` and `Sidebar` are stacked vertically (e.g. on a mobile device).
`Layout` should always work in any screen size.

<Example src="<div data-view-component='true' class='Layout Layout--flowRow-until-md Layout--sidebarPosition-start Layout--sidebarPosition-flowRow-start'>    <div data-view-component='true' class='Layout-sidebar border'>Sidebar</div>  <div data-view-component='true' class='Layout-main border'>Main</div></div>" />

```erb

<%= render(Primer::Alpha::Layout.new) do |c| %>
  <% c.main(border: true) { "Main" } %>
  <% c.sidebar(border: true) { "Sidebar" } %>
<% end %>
```
## [Layout](/components/layout)

Use `Layout` to build a main/sidebar layout.

<Example src="<div data-view-component='true' class='gutter-condensed gutter-lg d-flex'>  <div data-view-component='true' class='flex-shrink-0 col-9'>Main</div>    <div data-view-component='true' class='flex-shrink-0 col-3'>Sidebar</div></div>" />

```erb
<%= render(Primer::LayoutComponent.new) do |component| %>
  <% component.sidebar { "Sidebar" } %>
  <% component.main { "Main" } %>
<% end %>
```
## [Link](/components/link)

Use `Link` for navigating from one page to another. `Link` styles anchor tags with default blue styling and hover text-decoration.

<Example src="<a href='#' data-view-component='true'>Link</a>" />

```erb
<%= render(Primer::LinkComponent.new(href: "#")) { "Link" } %>
```
## [LocalTime](/components/localtime)

Use `LocalTime` to format a date and time in the user's preferred locale format. This component requires JavaScript.

<Example src="<local-time datetime='2014-06-01T13:05:07+00:00' weekday='short' year='numeric' month='short' day='numeric' hour='numeric' minute='numeric' second='numeric' time-zone-name='short' data-view-component='true'>June 1, 2014 13:05 +00:00</local-time>" />

```erb
<%= render(Primer::LocalTime.new(datetime: DateTime.parse("2014-06-01T13:05:07Z"))) %>
```
## [Markdown](/components/markdown)

Use `Markdown` to wrap markdown content.

<Example src="<div data-view-component='true' class='markdown-body'>  <p>Text can be <b>bold</b>, <i>italic</i>, or <s>strikethrough</s>. <a href='https://github.com'>Links </a> should be blue with no underlines (unless hovered over).</p>  <p>There should be whitespace between paragraphs. There should be whitespace between paragraphs. There should be whitespace between paragraphs. There should be whitespace between paragraphs.</p>  <p>There should be whitespace between paragraphs. There should be whitespace between paragraphs. There should be whitespace between paragraphs. There should be whitespace between paragraphs.</p>  <blockquote>    <p>There should be no margin above this first sentence.</p>    <p>Blockquotes should be a lighter gray with a gray border along the left side.</p>    <p>There should be no margin below this final sentence.</p>  </blockquote>  <h1>Header 1</h1>  <p>This is a normal paragraph following a header. Bacon ipsum dolor sit amet t-bone doner shank drumstick, pork belly porchetta chuck sausage brisket ham hock rump pig. Chuck kielbasa leberkas, pork bresaola ham hock filet mignon cow shoulder short ribs biltong.</p>  <h2>Header 2</h2>  <blockquote>This is a blockquote following a header. Bacon ipsum dolor sit amet t-bone doner shank drumstick, pork belly porchetta chuck sausage brisket ham hock rump pig. Chuck kielbasa leberkas, pork bresaola ham hock filet mignon cow shoulder short ribs biltong.</blockquote>  <h3>Header 3</h3>  <pre><code>This is a code block following a header.</code></pre>  <h4>Header 4</h4>  <ul>    <li>This is an unordered list following a header.</li>    <li>This is an unordered list following a header.</li>    <li>This is an unordered list following a header.</li>  </ul>  <h5>Header 5</h5>  <ol>    <li>This is an ordered list following a header.</li>    <li>This is an ordered list following a header.</li>    <li>This is an ordered list following a header.</li>  </ol>  <h6>Header 6</h6>  <table>    <thead>      <tr>        <th>What</th>        <th>Follows</th>      </tr>    </thead>    <tbody>      <tr>        <td>A table</td>        <td>A header</td>      </tr>      <tr>        <td>A table</td>        <td>A header</td>      </tr>      <tr>        <td>A table</td>        <td>A header</td>      </tr>    </tbody>  </table>  <hr />  <p>There's a horizontal rule above and below this.</p>  <hr />  <p>Here is an unordered list:</p>  <ul>    <li>Salt-n-Pepa</li>    <li>Bel Biv DeVoe</li>    <li>Kid 'N Play</li>  </ul>  <p>And an ordered list:</p>  <ol>    <li>Michael Jackson</li>    <li>Michael Bolton</li>    <li>Michael Buble</li>  </ol>  <p>And an unordered task list:</p>  <ul>    <li><input type='checkbox' id='create-markdown' checked /><label for='create-markdown'>Create a sample markdown document</label><br></li>    <li><input type='checkbox' id='tasks-list' checked /><label for='tasks-list'>Add tasks list to it</label><br></li>    <li><input type='checkbox' id='take-vacation' checked /><label for='take-vacation'>Take a vacation</label><br></li>  </ul>  <p>And a 'mixed' task list:</p>  <ul>    <li><input type='checkbox'id='steal-underpants'/><label for='steal-underpants'>Steal underpants</label></li>    <li>?</li>    <li><input type='checkbox'id='profit'/><label for='profit'>Profit!</label></li>  </ul>  And a nested list:  <ul>    <li>Jackson 5      <ul>        <li>Michael</li>        <li>Tito</li>        <li>Jackie</li>        <li>Marlon</li>        <li>Jermaine</li>      </ul>    </li>    <li>TMNT      <ul>        <li>Leonardo</li>        <li>Michelangelo</li>        <li>Donatello</li>        <li>Raphael</li>      </ul>    </li>  </ul>  <p>Definition lists can be used with HTML syntax. Definition terms are bold and italic.</p>  <dl>      <dt>Name</dt>      <dd>Godzilla</dd>      <dt>Born</dt>      <dd>1952</dd>      <dt>Birthplace</dt>      <dd>Japan</dd>      <dt>Color</dt>      <dd>Green</dd>  </dl>  <hr />  <p>Tables should have bold headings and alternating shaded rows.</p>  <table>    <thead>      <tr>        <th>Artist</th>        <th>Album</th>        <th>Year</th>      </tr>    </thead>    <tbody>      <tr>        <td>David Bowie</td>        <td>Scary Monsters</td>        <td>1980</td>      </tr>      <tr>        <td>Prince</td>        <td>Purple Rain</td>        <td>1982</td>      </tr>      <tr>        <td>Beastie Boys</td>        <td>License to Ill</td>        <td>1986</td>      </tr>      <tr>        <td>Janet Jackson</td>        <td>Rhythm Nation 1814</td>        <td>1989</td>      </tr>    </tbody>  </table>  <p>If a table is too wide, it should condense down and/or scroll horizontally.</p>  <table>    <thead>      <tr>        <th>Artist</th>        <th>Album</th>        <th>Year</th>        <th>Label</th>        <th>Songs</th>      </tr>    </thead>    <tbody>      <tr>        <td>David Bowie</td>        <td>Scary Monsters</td>        <td>1980</td>        <td>RCA Records</td>        <td>It's No Game (No. 1), Up the Hill Backwards, Scary Monsters (And Super Creeps), Ashes to Ashes, Fashion, Teenage Wildlife, Scream Like a Baby, Kingdom Come, Because You're Young, It's No Game (No. 2)</td>      </tr>      <tr>        <td>Prince</td>        <td>Purple Rain</td>        <td>1982</td>        <td>Warner Brothers Records</td>        <td>Let's Go Crazy, Take Me With U, The Beautiful Ones, Computer Blue, Darling Nikki, When Doves Cry, I Would Die 4 U, Baby I'm a Star, Purple Rain</td>      </tr>      <tr>        <td>Beastie Boys</td>        <td>License to Ill</td>        <td>1986</td>        <td>Def Jam</td>        <td>Rhymin &amp; Stealin, The New Style, She's Crafty, Posse in Effect, Slow Ride, Girls, Fight for Your Right, No Sleep till Brooklyn, Paul Revere, 'Hold It Now, Hit It', Brass Monkey, Slow and Low, Time to Get Ill</td>      </tr>      <tr>        <td>Janet Jackson</td>        <td>Rhythm Nation 1814</td>        <td>1989</td>        <td>A&amp;M</td>        <td>Interlude: Pledge, Rhythm Nation, Interlude: T.V., State of the World, Interlude: Race, The Knowledge, Interlude: Let's Dance, Miss You Much, Interlude: Come Back, Love Will Never Do (Without You), Livin' in a World (They Didn't Make), Alright, Interlude: Hey Baby, Escapade, Interlude: No Acid, Black Cat, Lonely, Come Back to Me, Someday Is Tonight, Interlude: Livin'...In Complete Darkness</td>      </tr>    </tbody>  </table>  <hr />  <p>Code snippets like <code>var foo = 'bar';</code> can be shown inline.</p>  <p>Also, <code>this should vertically align</code> <s><code>with this</code></s> <s>and this</s>.</p>  <p>Code can also be shown in a block element.</p>  <pre><code>var foo = 'bar';</code></pre>  <p>Code can also use syntax highlighting.</p>  <pre><code>var foo = 'bar';</code></pre>  <pre tabindex='0'><code>Long, single-line code blocks should not wrap. They should horizontally scroll if they are too long. This line should be long enough to demonstrate this.</code></pre>  <pre tabindex='0'><code>var foo = 'The same thing is true for code with syntax highlighting. A single line of code should horizontally scroll if it is really long.';</code></pre>  <p>Inline code inside table cells should still be distinguishable.</p>  <table>    <thead>      <tr>        <th>Language</th>        <th>Code</th>      </tr>    </thead>    <tbody>      <tr>        <td>JavasScript</td>        <td><code>var foo = 'bar';</code></td>      </tr>      <tr>        <td>Ruby</td>        <td><code>foo = 'bar'</code></td>      </tr>    </tbody>  </table>  <pre><code>This is the final element on the page and there should be no margin below this.</code></pre></div>" />

```erb
<%= render(Primer::Markdown.new) do %>
  <p>Text can be <b>bold</b>, <i>italic</i>, or <s>strikethrough</s>. <a href="https://github.com">Links </a> should be blue with no underlines (unless hovered over).</p>

  <p>There should be whitespace between paragraphs. There should be whitespace between paragraphs. There should be whitespace between paragraphs. There should be whitespace between paragraphs.</p>

  <p>There should be whitespace between paragraphs. There should be whitespace between paragraphs. There should be whitespace between paragraphs. There should be whitespace between paragraphs.</p>

  <blockquote>
    <p>There should be no margin above this first sentence.</p>
    <p>Blockquotes should be a lighter gray with a gray border along the left side.</p>
    <p>There should be no margin below this final sentence.</p>
  </blockquote>

  <h1>Header 1</h1>

  <p>This is a normal paragraph following a header. Bacon ipsum dolor sit amet t-bone doner shank drumstick, pork belly porchetta chuck sausage brisket ham hock rump pig. Chuck kielbasa leberkas, pork bresaola ham hock filet mignon cow shoulder short ribs biltong.</p>

  <h2>Header 2</h2>

  <blockquote>This is a blockquote following a header. Bacon ipsum dolor sit amet t-bone doner shank drumstick, pork belly porchetta chuck sausage brisket ham hock rump pig. Chuck kielbasa leberkas, pork bresaola ham hock filet mignon cow shoulder short ribs biltong.</blockquote>

  <h3>Header 3</h3>

  <pre><code>This is a code block following a header.</code></pre>

  <h4>Header 4</h4>

  <ul>
    <li>This is an unordered list following a header.</li>
    <li>This is an unordered list following a header.</li>
    <li>This is an unordered list following a header.</li>
  </ul>

  <h5>Header 5</h5>

  <ol>
    <li>This is an ordered list following a header.</li>
    <li>This is an ordered list following a header.</li>
    <li>This is an ordered list following a header.</li>
  </ol>

  <h6>Header 6</h6>

  <table>
    <thead>
      <tr>
        <th>What</th>
        <th>Follows</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>A table</td>
        <td>A header</td>
      </tr>
      <tr>
        <td>A table</td>
        <td>A header</td>
      </tr>
      <tr>
        <td>A table</td>
        <td>A header</td>
      </tr>
    </tbody>
  </table>

  <hr />

  <p>There's a horizontal rule above and below this.</p>

  <hr />

  <p>Here is an unordered list:</p>

  <ul>
    <li>Salt-n-Pepa</li>
    <li>Bel Biv DeVoe</li>
    <li>Kid 'N Play</li>
  </ul>

  <p>And an ordered list:</p>

  <ol>
    <li>Michael Jackson</li>
    <li>Michael Bolton</li>
    <li>Michael Buble</li>
  </ol>

  <p>And an unordered task list:</p>

  <ul>
    <li><input type="checkbox" id="create-markdown" checked /><label for="create-markdown">Create a sample markdown document</label><br></li>
    <li><input type="checkbox" id="tasks-list" checked /><label for="tasks-list">Add tasks list to it</label><br></li>
    <li><input type="checkbox" id="take-vacation" checked /><label for="take-vacation">Take a vacation</label><br></li>
  </ul>

  <p>And a "mixed" task list:</p>

  <ul>
    <li><input type="checkbox"id="steal-underpants"/><label for="steal-underpants">Steal underpants</label></li>
    <li>?</li>
    <li><input type="checkbox"id="profit"/><label for="profit">Profit!</label></li>
  </ul>

  And a nested list:

  <ul>
    <li>Jackson 5
      <ul>
        <li>Michael</li>
        <li>Tito</li>
        <li>Jackie</li>
        <li>Marlon</li>
        <li>Jermaine</li>
      </ul>
    </li>
    <li>TMNT
      <ul>
        <li>Leonardo</li>
        <li>Michelangelo</li>
        <li>Donatello</li>
        <li>Raphael</li>
      </ul>
    </li>
  </ul>

  <p>Definition lists can be used with HTML syntax. Definition terms are bold and italic.</p>

  <dl>
      <dt>Name</dt>
      <dd>Godzilla</dd>
      <dt>Born</dt>
      <dd>1952</dd>
      <dt>Birthplace</dt>
      <dd>Japan</dd>
      <dt>Color</dt>
      <dd>Green</dd>
  </dl>

  <hr />

  <p>Tables should have bold headings and alternating shaded rows.</p>

  <table>
    <thead>
      <tr>
        <th>Artist</th>
        <th>Album</th>
        <th>Year</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>David Bowie</td>
        <td>Scary Monsters</td>
        <td>1980</td>
      </tr>
      <tr>
        <td>Prince</td>
        <td>Purple Rain</td>
        <td>1982</td>
      </tr>
      <tr>
        <td>Beastie Boys</td>
        <td>License to Ill</td>
        <td>1986</td>
      </tr>
      <tr>
        <td>Janet Jackson</td>
        <td>Rhythm Nation 1814</td>
        <td>1989</td>
      </tr>
    </tbody>
  </table>

  <p>If a table is too wide, it should condense down and/or scroll horizontally.</p>

  <table>
    <thead>
      <tr>
        <th>Artist</th>
        <th>Album</th>
        <th>Year</th>
        <th>Label</th>
        <th>Songs</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>David Bowie</td>
        <td>Scary Monsters</td>
        <td>1980</td>
        <td>RCA Records</td>
        <td>It's No Game (No. 1), Up the Hill Backwards, Scary Monsters (And Super Creeps), Ashes to Ashes, Fashion, Teenage Wildlife, Scream Like a Baby, Kingdom Come, Because You're Young, It's No Game (No. 2)</td>
      </tr>
      <tr>
        <td>Prince</td>
        <td>Purple Rain</td>
        <td>1982</td>
        <td>Warner Brothers Records</td>
        <td>Let's Go Crazy, Take Me With U, The Beautiful Ones, Computer Blue, Darling Nikki, When Doves Cry, I Would Die 4 U, Baby I'm a Star, Purple Rain</td>
      </tr>
      <tr>
        <td>Beastie Boys</td>
        <td>License to Ill</td>
        <td>1986</td>
        <td>Def Jam</td>
        <td>Rhymin &amp; Stealin, The New Style, She's Crafty, Posse in Effect, Slow Ride, Girls, Fight for Your Right, No Sleep till Brooklyn, Paul Revere, "Hold It Now, Hit It", Brass Monkey, Slow and Low, Time to Get Ill</td>
      </tr>
      <tr>
        <td>Janet Jackson</td>
        <td>Rhythm Nation 1814</td>
        <td>1989</td>
        <td>A&amp;M</td>
        <td>Interlude: Pledge, Rhythm Nation, Interlude: T.V., State of the World, Interlude: Race, The Knowledge, Interlude: Let's Dance, Miss You Much, Interlude: Come Back, Love Will Never Do (Without You), Livin' in a World (They Didn't Make), Alright, Interlude: Hey Baby, Escapade, Interlude: No Acid, Black Cat, Lonely, Come Back to Me, Someday Is Tonight, Interlude: Livin'...In Complete Darkness</td>
      </tr>
    </tbody>
  </table>

  <hr />

  <p>Code snippets like <code>var foo = "bar";</code> can be shown inline.</p>

  <p>Also, <code>this should vertically align</code> <s><code>with this</code></s> <s>and this</s>.</p>

  <p>Code can also be shown in a block element.</p>

  <pre><code>var foo = "bar";</code></pre>

  <p>Code can also use syntax highlighting.</p>

  <pre><code>var foo = "bar";</code></pre>

  <pre tabindex="0"><code>Long, single-line code blocks should not wrap. They should horizontally scroll if they are too long. This line should be long enough to demonstrate this.</code></pre>

  <pre tabindex="0"><code>var foo = "The same thing is true for code with syntax highlighting. A single line of code should horizontally scroll if it is really long.";</code></pre>

  <p>Inline code inside table cells should still be distinguishable.</p>

  <table>
    <thead>
      <tr>
        <th>Language</th>
        <th>Code</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>JavasScript</td>
        <td><code>var foo = "bar";</code></td>
      </tr>
      <tr>
        <td>Ruby</td>
        <td><code>foo = "bar"</code></td>
      </tr>
    </tbody>
  </table>

  <pre><code>This is the final element on the page and there should be no margin below this.</code></pre>
<% end %>
```
## [Menu](/components/menu)

Use `Menu` to create vertical lists of navigational links.

<Example src="<nav data-view-component='true' class='menu'>  <h2 data-view-component='true' class='menu-heading'>    Heading</h2>    <a href='#url' aria-current='page' data-view-component='true' class='menu-item'>    Item 1</a>    <a href='#url' data-view-component='true' class='menu-item'>    <svg aria-hidden='true' height='16' viewBox='0 0 16 16' version='1.1' width='16' data-view-component='true' class='octicon octicon-check'>    <path fill-rule='evenodd' d='M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z'></path></svg>    With Icon</a>    <a href='#url' data-view-component='true' class='menu-item'>    <svg aria-hidden='true' height='16' viewBox='0 0 16 16' version='1.1' width='16' data-view-component='true' class='octicon octicon-check'>    <path fill-rule='evenodd' d='M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z'></path></svg>    With Icon and Counter    <span title='25' data-view-component='true' class='Counter'>25</span></a></nav>" />

```erb
<%= render(Primer::MenuComponent.new) do |c| %>
  <% c.heading(tag: :h2) do %>
    Heading
  <% end %>
  <% c.item(selected: true, href: "#url") do %>
    Item 1
  <% end %>
  <% c.item(href: "#url") do %>
    <%= render(Primer::OcticonComponent.new("check")) %>
    With Icon
  <% end %>
  <% c.item(href: "#url") do %>
    <%= render(Primer::OcticonComponent.new("check")) %>
    With Icon and Counter
    <%= render(Primer::CounterComponent.new(count: 25)) %>
  <% end %>
<% end %>
```
## [NavigationTab](/components/navigationtab)

This component is part of navigation components such as `Primer::Alpha::TabNav`
and `Primer::Alpha::UnderlineNav` and should not be used by itself.

<Example src="  <a aria-current='page' data-view-component='true'>          <span data-view-component='true'>Selected</span>    </a>  <a data-view-component='true'>          <span data-view-component='true'>Not selected</span>    </a>" />

```erb
<%= render(Primer::Navigation::TabComponent.new(selected: true)) do |c| %>
  <% c.text { "Selected" } %>
<% end %>
<%= render(Primer::Navigation::TabComponent.new) do |c| %>
  <% c.text { "Not selected" } %>
<% end %>
```
## [Octicon](/components/octicon)

`Octicon` renders an [Octicon](https://primer.style/octicons/) with [System arguments](/system-arguments).
`Octicon` can also be rendered with the `primer_octicon` helper, which accepts the same arguments.

<Example src="<svg aria-hidden='true' height='16' viewBox='0 0 16 16' version='1.1' width='16' data-view-component='true' class='octicon octicon-check'>    <path fill-rule='evenodd' d='M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z'></path></svg><svg aria-hidden='true' height='16' viewBox='0 0 16 16' version='1.1' width='16' data-view-component='true' class='octicon octicon-check'>    <path fill-rule='evenodd' d='M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z'></path></svg>" />

```erb
<%= render(Primer::OcticonComponent.new(:check)) %>
<%= render(Primer::OcticonComponent.new(icon: :check)) %>
```
## [OcticonSymbols](/components/octiconsymbols)

OcticonSymbols renders a symbol dictionary using a list of [Octicon](https://primer.style/octicons/).

<Example src="<svg aria-hidden='true' height='16' viewBox='0 0 16 16' version='1.1' width='16' data-view-component='true' class='octicon octicon-check color-fg-success'>    <use href='#octicon_check_16'></use></svg><svg aria-hidden='true' height='16' viewBox='0 0 16 16' version='1.1' width='16' data-view-component='true' class='octicon octicon-check color-fg-danger'>    <use href='#octicon_check_16'></use></svg><svg aria-hidden='true' height='24' viewBox='0 0 24 24' version='1.1' width='24' data-view-component='true' class='octicon octicon-check'>    <use href='#octicon_check_24'></use></svg><svg xmlns='http://www.w3.org/2000/svg' hidden>  <symbol id='octicon_check_16' viewBox='0 0 16 16' width='16' height='16'><path fill-rule='evenodd' d='M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z'></path></symbol><symbol id='octicon_check_24' viewBox='0 0 24 24' width='24' height='24'><path fill-rule='evenodd' d='M21.03 5.72a.75.75 0 010 1.06l-11.5 11.5a.75.75 0 01-1.072-.012l-5.5-5.75a.75.75 0 111.084-1.036l4.97 5.195L19.97 5.72a.75.75 0 011.06 0z'></path></symbol></svg>" />

```erb
<%= render(Primer::OcticonComponent.new(icon: :check, use_symbol: true, color: :success)) %>
<%= render(Primer::OcticonComponent.new(icon: :check, use_symbol: true, color: :danger)) %>
<%= render(Primer::OcticonComponent.new(icon: :check, use_symbol: true, size: :medium)) %>
<%= render(Primer::OcticonSymbolsComponent.new(icons: [{ symbol: :check }, { symbol: :check, size: :medium }])) %>
```
## [Popover](/components/popover)

Use `Popover` to bring attention to specific user interface elements, typically to suggest an action or to guide users through a new experience.

By default, the popover renders with absolute positioning, meaning it should usually be wrapped in an element with a relative position in order to be positioned properly. To render the popover with relative positioning, use the relative property.

<Example src="<div data-view-component='true' class='Popover position-relative right-0 left-0'>  <div data-view-component='true' class='Popover-message Box p-4 mt-2 mx-auto text-left color-shadow-large'>    <h4 data-view-component='true' class='mb-2'>    Activity feed</h4>        This is the Popover body.</div></div>" />

```erb
<%= render Primer::PopoverComponent.new do |component| %>
  <% component.heading do %>
    Activity feed
  <% end %>
  <% component.body do %>
    This is the Popover body.
  <% end %>
<% end %>
```
## [ProgressBar](/components/progressbar)

Use `ProgressBar` to visualize task completion.

<Example src="<span data-view-component='true' class='Progress'>    <span style='width: 25%;' data-view-component='true' class='Progress-item color-bg-success-emphasis'></span></span>" />

```erb
<%= render(Primer::ProgressBarComponent.new) do |component| %>
  <% component.item(percentage: 25) %>
<% end %>
```
## [Spinner](/components/spinner)

Use `Spinner` to let users know that content is being loaded.

<Example src="<svg style='box-sizing: content-box; color: var(--color-icon-primary);' width='32' height='32' viewBox='0 0 16 16' fill='none' data-view-component='true' class='anim-rotate'>  <circle cx='8' cy='8' r='7' stroke='currentColor' stroke-opacity='0.25' stroke-width='2' vector-effect='non-scaling-stroke' />  <path d='M15 8a7.002 7.002 0 00-7-7' stroke='currentColor' stroke-width='2' stroke-linecap='round' vector-effect='non-scaling-stroke' /></svg>" />

```erb
<%= render(Primer::SpinnerComponent.new) %>
```
## [State](/components/state)

Use `State` for rendering the status of an item.

<Example src="<span title='title' data-view-component='true' class='State'>State</span>" />

```erb
<%= render(Primer::StateComponent.new(title: "title")) { "State" } %>
```
## [Subhead](/components/subhead)

Use `Subhead` as the start of a section. The `:heading` slot will render an `<h2>` font-sized text.

- Optionally set the `:description` slot to render a short description and the `:actions` slot for a related action.
- Use a succint, one-line description for the `:description` slot. For longer descriptions, omit the description slot and render a paragraph below the `Subhead`.
- Use the actions slot to render a related action to the right of the heading. Use [Button](/components/button) or [Link](/components/link).

<Example src="<div data-view-component='true' class='Subhead'>  <h3 data-view-component='true' class='Subhead-heading'>    My Heading</h3>    <div data-view-component='true' class='Subhead-description'>    My Description</div></div>" />

```erb
<%= render(Primer::SubheadComponent.new) do |component| %>
  <% component.heading(tag: :h3) do %>
    My Heading
  <% end %>
  <% component.description do %>
    My Description
  <% end %>
<% end %>
```
## [TabContainer](/components/tabcontainer)

Use `TabContainer` to create tabbed content with keyboard support. This component does not add any styles.
It only provides the tab functionality. If you want styled Tabs you can look at [TabNav](/components/alpha/tabnav).

This component requires javascript.

<Example src="<tab-container data-view-component='true'>  <div role='tablist'>    <button type='button' role='tab' aria-selected='true'>Tab one</button>    <button type='button' role='tab' tabindex='-1'>Tab two</button>    <button type='button' role='tab' tabindex='-1'>Tab three</button>  </div>  <div role='tabpanel'>    Panel 1  </div>  <div role='tabpanel' hidden>    Panel 2  </div>  <div role='tabpanel' hidden>    Panel 3  </div></tab-container>" />

```erb
<%= render(Primer::TabContainerComponent.new)  do %>
  <div role="tablist">
    <button type="button" role="tab" aria-selected="true">Tab one</button>
    <button type="button" role="tab" tabindex="-1">Tab two</button>
    <button type="button" role="tab" tabindex="-1">Tab three</button>
  </div>
  <div role="tabpanel">
    Panel 1
  </div>
  <div role="tabpanel" hidden>
    Panel 2
  </div>
  <div role="tabpanel" hidden>
    Panel 3
  </div>
<% end %>
```
## [TabNav](/components/alpha/tabnav)

Use `TabNav` to style navigation with a tab-based selected state, typically used for navigation placed at the top of the page.
For panel navigation, use [TabPanels](/components/alpha/tabpanels) instead.

<Example src="<nav aria-label='Default' data-view-component='true' class='tabnav'>    <ul data-view-component='true' class='tabnav-tabs'>      <li data-view-component='true' class='d-inline-flex'>  <a href='#' aria-current='page' data-view-component='true' class='tabnav-tab'>          Tab 1    </a></li>      <li data-view-component='true' class='d-inline-flex'>  <a href='#' data-view-component='true' class='tabnav-tab'>          Tab 2    </a></li>      <li data-view-component='true' class='d-inline-flex'>  <a href='#' data-view-component='true' class='tabnav-tab'>          Tab 3    </a></li></ul>  </nav>" />

```erb
<%= render(Primer::Alpha::TabNav.new(label: "Default")) do |c| %>
  <% c.tab(selected: true, href: "#") { "Tab 1" } %>
  <% c.tab(href: "#") { "Tab 2" } %>
  <% c.tab(href: "#") { "Tab 3" } %>
<% end %>
```
## [TabPanels](/components/alpha/tabpanels)

Use `TabPanels` for tabs with panel navigation.

<Example src="<tab-container data-view-component='true'>  <div data-view-component='true' class='tabnav'>        <ul role='tablist' aria-label='With panels' data-view-component='true' class='tabnav-tabs'>        <li role='presentation' data-view-component='true' class='d-inline-flex'>  <button id='tab-1' type='button' role='tab' aria-controls='panel-tab-1' aria-selected='true' data-view-component='true' class='tabnav-tab'>          <span data-view-component='true'>Tab 1</span>    </button></li>        <li role='presentation' data-view-component='true' class='d-inline-flex'>  <button id='tab-2' type='button' role='tab' aria-controls='panel-tab-2' data-view-component='true' class='tabnav-tab'>          <span data-view-component='true'>Tab 2</span>    </button></li></ul>    </div>    <div id='panel-tab-1' role='tabpanel' tabindex='0' aria-labelledby='tab-1' data-view-component='true'>      Panel 1</div>    <div id='panel-tab-2' role='tabpanel' tabindex='0' hidden='hidden' aria-labelledby='tab-2' data-view-component='true'>      Panel 2</div></tab-container>" />

```erb
<%= render(Primer::Alpha::TabPanels.new(label: "With panels")) do |component| %>
  <% component.tab(id: "tab-1", selected: true) do |t| %>
    <% t.text { "Tab 1" } %>
    <% t.panel do %>
      Panel 1
    <% end %>
  <% end %>
  <% component.tab(id: "tab-2") do |t| %>
    <% t.text { "Tab 2" } %>
    <% t.panel do %>
      Panel 2
    <% end %>
  <% end %>
<% end %>
```
## [Text](/components/beta/text)

`Text` is a wrapper component that will apply typography styles to the text inside.

<Example src="<p data-view-component='true' class='text-bold'>Bold Text</p><p data-view-component='true' class='color-fg-danger'>Danger Text</p>" />

```erb
<%= render(Primer::Beta::Text.new(tag: :p, font_weight: :bold)) { "Bold Text" } %>
<%= render(Primer::Beta::Text.new(tag: :p, color: :danger)) { "Danger Text" } %>
```
## [TimeAgo](/components/timeago)

Use `TimeAgo` to display a time relative to how long ago it was. This component requires JavaScript.

<Example src="<time-ago datetime='1989-11-28T05:00:00Z' data-view-component='true' class='no-wrap'>Nov 28, 1989</time-ago>" />

```erb
<%= render(Primer::TimeAgoComponent.new(time: Time.at(628232400))) %>
```
## [TimelineItem](/components/timelineitem)

Use `TimelineItem` to display items on a vertical timeline, connected by badge elements.

<Example src="<div style='padding-left: 60px'>  <div data-view-component='true' class='TimelineItem'>  <img src='https://github.com/github.png' alt='github' size='40' height='40' width='40' data-view-component='true' class='TimelineItem-avatar avatar' />  <div data-view-component='true' class='TimelineItem-badge color-bg-success-emphasis color-fg-on-emphasis'><svg aria-hidden='true' height='16' viewBox='0 0 16 16' version='1.1' width='16' data-view-component='true' class='octicon octicon-check'>    <path fill-rule='evenodd' d='M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z'></path></svg></div>  <div data-view-component='true' class='TimelineItem-body'>Success!</div></div></div>" />

```erb
<div style="padding-left: 60px">
  <%= render(Primer::TimelineItemComponent.new) do |component| %>
    <% component.avatar(src: "https://github.com/github.png", alt: "github") %>
    <% component.badge(bg: :success_emphasis, color: :on_emphasis, icon: :check) %>
    <% component.body { "Success!" } %>
  <% end %>
</div>
```
## [Tooltip](/components/tooltip)

`Tooltip` is a wrapper component that will apply a tooltip to the provided content.

<Example src="<div class='pt-5'>  <span aria-label='Even bolder' data-view-component='true' class='tooltipped tooltipped-n'>Default Bold Text</span></div>" />

```erb
<div class="pt-5">
  <%= render(Primer::Tooltip.new(label: "Even bolder")) { "Default Bold Text" } %>
</div>
```
## [Truncate](/components/truncate)

Use `Truncate` to shorten overflowing text with an ellipsis.

<Example src="<div class='col-2'>  <p data-view-component='true' class='css-truncate css-truncate-overflow'>branch-name-that-is-really-long</p></div>" />

```erb
<div class="col-2">
  <%= render(Primer::Truncate.new(tag: :p)) { "branch-name-that-is-really-long" } %>
</div>
```
## [Truncate](/components/beta/truncate)

Use `Truncate` to shorten overflowing text with an ellipsis.

<Example src="<span data-view-component='true' class='Truncate'>    <span data-view-component='true' class='Truncate-text'>branch-name-that-is-really-long</span></span>" />

```erb
<%= render(Primer::Beta::Truncate.new) { "branch-name-that-is-really-long" } %>
```
## [UnderlineNav](/components/alpha/underlinenav)

Use `UnderlineNav` to style navigation links with a minimal
underlined selected state, typically placed at the top
of the page.

For panel navigation, use [UnderlinePanels](/components/alpha/underlinepanels) instead.

<Example src="<nav aria-label='Default with nav element' data-view-component='true' class='UnderlineNav'>  <ul data-view-component='true' class='UnderlineNav-body list-style-none'>      <li data-view-component='true' class='d-inline-flex'>  <a href='#' aria-current='page' data-view-component='true' class='UnderlineNav-item'>          Item 1    </a></li>      <li data-view-component='true' class='d-inline-flex'>  <a href='#' data-view-component='true' class='UnderlineNav-item'>          Item 2    </a></li></ul>    <div data-view-component='true' class='UnderlineNav-actions'>    <button type='button' data-view-component='true' class='btn'>  Button!</button></div></nav>" />

```erb
<%= render(Primer::Alpha::UnderlineNav.new(label: "Default with nav element")) do |component| %>
  <% component.tab(href: "#", selected: true) { "Item 1" } %>
  <% component.tab(href: "#") { "Item 2" } %>
  <% component.actions do %>
    <%= render(Primer::ButtonComponent.new) { "Button!" } %>
  <% end %>
<% end %>
```
## [UnderlinePanels](/components/alpha/underlinepanels)

Use `UnderlinePanels` to style tabs with an associated panel and an underlined selected state.

<Example src="<tab-container data-view-component='true'>  <div data-view-component='true' class='UnderlineNav'>    <ul role='tablist' aria-label='With panels' data-view-component='true' class='UnderlineNav-body list-style-none'>        <li role='presentation' data-view-component='true' class='d-inline-flex'>  <button id='tab-1' type='button' role='tab' aria-controls='panel-tab-1' aria-selected='true' data-view-component='true' class='UnderlineNav-item'>          <span data-view-component='true'>Tab 1</span>    </button></li>        <li role='presentation' data-view-component='true' class='d-inline-flex'>  <button id='tab-2' type='button' role='tab' aria-controls='panel-tab-2' data-view-component='true' class='UnderlineNav-item'>          <span data-view-component='true'>Tab 2</span>    </button></li></ul>      <div data-view-component='true' class='UnderlineNav-actions'>    <button type='button' data-view-component='true' class='btn'>  Button!</button></div></div>    <div id='panel-tab-1' role='tabpanel' tabindex='0' aria-labelledby='tab-1' data-view-component='true'>      Panel 1</div>    <div id='panel-tab-2' role='tabpanel' tabindex='0' hidden='hidden' aria-labelledby='tab-2' data-view-component='true'>      Panel 2</div></tab-container>" />

```erb
<%= render(Primer::Alpha::UnderlinePanels.new(label: "With panels")) do |component| %>
  <% component.tab(id: "tab-1", selected: true) do |t| %>
    <% t.text { "Tab 1" } %>
    <% t.panel do %>
      Panel 1
    <% end %>
  <% end %>
  <% component.tab(id: "tab-2") do |t| %>
    <% t.text { "Tab 2" } %>
    <% t.panel do %>
      Panel 2
    <% end %>
  <% end %>
  <% component.actions do %>
    <%= render(Primer::ButtonComponent.new) { "Button!" } %>
  <% end %>
<% end %>
```
