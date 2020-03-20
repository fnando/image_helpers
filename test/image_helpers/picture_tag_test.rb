# frozen_string_literal: true

require "test_helper"

class PictureTagTest < Minitest::Test
  test "renders <img>" do
    html = render <<~ERB
      <%= picture_tag [{url: "logo.svg", alt: "some desc"}] %>
    ERB

    assert_html %[<picture><img alt="some desc" src="/logo.svg"/></picture>],
                html
  end

  test "renders <source>" do
    html = render <<~ERB
      <%= picture_tag [
        {url: "logo.svg", alt: "some desc"},
        {url: "dark/logo.svg", media: "(prefers-color-scheme: dark)"}
      ] %>
    ERB

    expected = <<~HTML
      <picture>
        <source srcset="/dark/logo.svg" media="(prefers-color-scheme: dark)" />
        <img alt="some desc" src="/logo.svg" />
      </picture>
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
    Nokogiri::HTML(content).css("picture").first.to_xhtml(indent: 2)
  end
end
