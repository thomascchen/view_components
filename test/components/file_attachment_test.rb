# frozen_string_literal: true

require "test_helper"

class PrimerFileAttachmentTest < Minitest::Test
  include Primer::ComponentTestHelpers

  def test_renders
    assert_text("Add a test here")
  end
end
