# frozen_string_literal: true

class Primer::FileAttachmentStories < ViewComponent::Storybook::Stories
  layout "storybook_preview"

  story(:file_attachment) do
    controls do
      classes "custom-class"
    end

    content do
      "Update your stories!"
    end
  end
end
