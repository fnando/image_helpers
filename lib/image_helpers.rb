# frozen_string_literal: true

require "image_helpers/version"

module ImageHelpers
  def picture_tag(images)
    return if images.empty?

    sources = images.select {|uri| uri[:media] }
    image = images.find {|uri| !uri[:media] }

    content_tag :picture do
      sources.each do |source|
        url = resolve_path_to_image(source.delete(:url))
        concat tag(:source, {srcset: url}.merge(source))
      end

      concat image_pack_tag(image.delete(:url), image)
    end
  end

  def svg_sprite(name, link, options = {})
    name = "#{name}.svg" unless name.end_with?(".svg")
    entry = current_webpacker_instance.config.source_entry_path.basename.to_s
    url = asset_pack_path("media/#{entry}/images/#{name}")
    options[:role] ||= "presentation"

    content_tag :svg, options do
      tag.use href: "#{url}##{link}"
    end
  end
end
