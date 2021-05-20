# frozen_string_literal: true

require "test_helper"

class PrimerAutoCompleteTest < Minitest::Test
  include Primer::ComponentTestHelpers

  def test_raises_if_no_input_is_defined
    assert_raises ArgumentError do
      render_inline Primer::AutoComplete.new(src: "/url", id: "my-id") do |component|
        component.icon(icon: :person)
      end
    end
  end

  def test_renders_results_without_explicitly_calling_it
    render_inline Primer::AutoComplete.new(src: "/url", id: "my-id") do |component|
      component.label(id: "test-label").with_content("Choices")
      component.input(name: "input")
    end

    assert_selector("auto-complete[for=\"my-id\"][src=\"/url\"]") do
      assert_selector("input.form-control")
      assert_selector("ul[id=\"my-id\"].autocomplete-results")
    end
  end

  def test_renders_with_aria_labelled_by_on_ul_and_input_when_label_slot_is_set
    render_inline Primer::AutoComplete.new(src: "/url", id: "my-id") do |component|
      component.label(id: "test-label").with_content("Choices")
      component.input(name: "input")
      component.results
    end

    assert_selector("auto-complete[for=\"my-id\"][src=\"/url\"]") do
      assert_selector("label[id=\"test-label\"]")
      assert_selector("input[aria-labelledby=\"test-label\"]")
      assert_selector("ul[id=\"my-id\"][aria-labelledby=\"test-label\"]")
      assert_text("Choices")
    end
  end

  def test_raises_if_no_label_or_aria_label
    err = assert_raises ArgumentError do
      render_inline Primer::AutoComplete.new(src: "/url", id: "my-id") do |component|
        component.input(name: "input")
      end
    end

    assert_equal("`aria-label` is required.", err.message)
  end

  def test_renders_with_icon
    render_inline Primer::AutoComplete.new(src: "/url", id: "my-id") do |component|
      component.input(name: "input", "aria-label": "Fruits")
      component.icon(icon: :person)
    end

    assert_selector("auto-complete[for=\"my-id\"][src=\"/url\"]") do
      assert_selector("input[aria-label=\"Fruits\"].form-control")
      assert_selector("svg.octicon.octicon-person")
    end
  end

  def test_renders_results_with_custom_classes
    render_inline Primer::AutoComplete.new(src: "/url", id: "my-id") do |component|
<<<<<<< HEAD
      component.input(classes: "custom-class")
      component.results(classes: "custom-class")
    end

    assert_selector("auto-complete[for=\"my-id\"][src=\"/url\"]") do
      assert_selector("input.custom-class")
      assert_selector("ul[id=\"my-id\"].autocomplete-results.custom-class")
=======
      component.input(classes: "custom-class", "aria-label": "Fruits")
      component.results(classes: "my-class", "aria-label": "Fruits")
    end

    assert_selector("auto-complete[for=\"my-id\"][src=\"/url\"]") do
      assert_selector("input[aria-label=\"Fruits\"].custom-class")
      assert_selector("ul[id=\"my-id\"][aria-label=\"Fruits\"].autocomplete-results.my-class")
>>>>>>> 38ed6fbc (update tests, documentation)
    end
  end
end
