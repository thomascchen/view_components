# frozen_string_literal: true

require "test_helper"

class PrimerBaseComponentTest < Minitest::Test
  include Primer::ComponentTestHelpers

  def test_renders_data_view_component
    render_inline(Primer::BaseComponent.new(tag: :div))

    assert_selector("div[data-view-component]")
  end

  def test_renders_title
    render_inline(Primer::BaseComponent.new(tag: :div, title: "title"))

    assert_selector("[title='title']")
  end

  def test_renders_content
    render_inline(Primer::BaseComponent.new(tag: :div)) do
      "content"
    end

    assert_text("content")
  end

  def test_skips_rendering_primer_class_if_value_is_nil
    result = render_inline(Primer::BaseComponent.new(tag: :div, my: nil))

    assert result.css("div").first.attribute("class").nil?
  end

  def test_renders_arbitrary_attributes
    render_inline(Primer::BaseComponent.new(tag: :div, itemtype: "http://schema.org/Code"))

    assert_selector("[itemtype='http://schema.org/Code']")
  end

  def test_renders_arbitrary_class_names
    render_inline(Primer::BaseComponent.new(tag: :div, classes: "foobar"))

    assert_selector(".foobar")
  end

  def test_renders_arbitrary_blank_attributes
    render_inline(Primer::BaseComponent.new(tag: :div, itemscope: true))

    assert_selector("[itemscope]")
  end

  def test_conditionally_renders_arbitrary_blank_attributes
    render_inline(Primer::BaseComponent.new(tag: :div, itemscope: false))

    refute_selector("[itemscope]")
  end

  def test_does_not_render_class_attribute_if_none_is_set
    render_inline(Primer::BaseComponent.new(tag: :div, title: "title"))

    refute_selector("div[class='']")
  end

  def test_does_not_render_primer_layout_classes_as_attributes
    render_inline(Primer::BaseComponent.new(tag: :div, my: 4))

    refute_selector("[my='4']")
  end

  def test_renders_as_a_link
    render_inline(Primer::BaseComponent.new(tag: :a, href: "http://google.com"))

    assert_selector("a[href='http://google.com']")
  end

  # We were calling tag.send(as), passing in :p ended up calling `p`, aka `puts`
  # Due to how Rails uses method_missing in TagHelper. See Slack convo:
  # https://github.slack.com/archives/C0HV3F37A/p1556216733019500
  def test_renders_as_a_paragraph
    render_inline(Primer::BaseComponent.new(tag: :p))

    refute_text("[")
  end

  def test_renders_data_attributes
    render_inline(Primer::BaseComponent.new(tag: :div, data: { foo: "bar" }))

    assert_selector("[data-foo='bar']")
  end

  def test_renders_test_selector
    render_inline(Primer::BaseComponent.new(tag: :div, test_selector: "bar"))

    refute_selector("[test_selector='bar']")
    assert_selector("[data-test-selector='bar']")
  end

  def test_renders_height_attribute
    render_inline(Primer::BaseComponent.new(tag: :div, height: 30))

    assert_selector("div[height=30]")
  end

  def test_renders_width_attribute
    render_inline(Primer::BaseComponent.new(tag: :div, width: 30))

    assert_selector("div[width=30]")
  end

  def test_does_not_render_height_as_attribute_if_value_is_class
    render_inline(Primer::BaseComponent.new(tag: :div, height: :fit))

    refute_selector("div[height='fit']")
    assert_selector("div.height-fit")
  end

  def test_does_not_render_width_as_attribute_if_value_is_class
    render_inline(Primer::BaseComponent.new(tag: :div, width: :fit))

    refute_selector("div[width='fit']")
    assert_selector("div.width-fit")
  end

  def test_restricts_allowed_system_arguments
    with_force_system_arguments(true) do
      error = assert_raises(ArgumentError) do
        render_inline(
          Primer::BaseComponent.new(
            tag: :div,
            p: 4,
            system_arguments_denylist: {
              [:p] => "Perhaps you could consider using :padding options of :foo, :bar, or :baz?"
            }
          )
        )
      end

      assert_includes(error.message, "Perhaps you could consider using")
    end
  end

  def test_strips_denied_system_arguments
    with_force_system_arguments(false) do
      render_inline(
        Primer::BaseComponent.new(
          tag: :div,
          p: 4,
          system_arguments_denylist: {
            [:p] => "Perhaps you could consider using :padding options of :foo, :bar, or :baz?"
          }
        )
      )
    end

    refute_selector("div[system_arguments_denylist]")
    refute_selector(".p-4")
  end

  def test_status
    assert_component_state(Primer::BaseComponent, :beta)
  end

  def test_does_not_assign_value_if_attribute_is_boolean
    render_inline(Primer::BaseComponent.new(tag: :div, "data-value": true))

    assert_selector("div[data-value]")
    refute_selector("[data-value=\"true\"]")
  end

  def test_does_not_transform_true_value_if_aria
    render_inline(Primer::BaseComponent.new(tag: :div, "aria-value": true))

    assert_selector("div[aria-value=\"true\"]")
  end
end
