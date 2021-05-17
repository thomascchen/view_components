module Primer
  class FileAttachmentPreview < ViewComponent::Preview
    def default
      render(Primer::FileAttachment.new)
    end
  end
end
