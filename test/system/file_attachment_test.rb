# frozen_string_literal: true

require "application_system_test_case"

class IntegrationFileAttachmentTest < ApplicationSystemTestCase
  def test_renders_component
    with_preview(:default)

    assert_selector("file-attachment")
  end
end
