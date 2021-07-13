module Primer
  class UnderlinePanelPreview < ViewComponent::Preview
    def default
      render(Primer::UnderlinePanel.new(label: "Test navigation")) do |c|
        c.tab(selected: true) do |t|
          t.panel { "Panel 1" }
          t.text { "Tab 1" }
        end
        c.tab do |t|
          t.panel { "Panel 2" }
          t.text { "Tab 2" }
        end
        c.tab do |t|
          t.panel { "Panel 3" }
          t.text { "Tab 3" }
        end
      end
    end
  end
end
