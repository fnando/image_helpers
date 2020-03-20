# frozen_string_literal: true

require "test_helper"

class SvgSpriteTest < Minitest::Test
  test "renders <svg>" do
    html = render <<~ERB
      <%= svg_sprite :icons, :checkmark %>
    ERB

    expected = <<~HTML
      <svg role="presentation"><use href="/icons.svg#checkmark"></svg>
    HTML

    assert_html expected, html
  end

  test "renders options" do
    html = render <<~ERB
      <%= svg_sprite :icons, :checkmark, class: "icon--lg" %>
    ERB

    expected = <<~HTML
      <svg class="icon--lg" role="presentation">
        <use href="/icons.svg#checkmark"></use>
      </svg>
    HTML

    assert_html expected, html
  end

  def render(content)
    ApplicationController.render(inline: content)
  end

  def assert_html(expected, actual)
    assert_equal to_html(expected), to_html(actual)
  end

  def to_html(content)
    Nokogiri::HTML(content).css("svg").first.to_xhtml(indent: 2)
  end
end
