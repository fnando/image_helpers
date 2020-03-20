# ImageHelpers

Some image helpers for Rails.

These helpers are optimized for
[webpacker](https://rubygems.org/gems/webpacker), which means that all images
will have paths resolved through packs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "image_helpers"
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install image_helpers

## Usage

First, include the helpers module on your `ApplicationHelper`.

```ruby
module ApplicationHelper
  include ImageHelpers
end
```

### `picture_tag(uris, options)`

Generate `<picture>` tags. The default image is the one that doesn't have the
`media` attribute.

```ruby
picture_tag([
  {url: "logo.svg", alt: "ACME Inc."},
  {url: "dark/logo.svg", media: "(prefers-color-scheme: dark)"}
])
```

This will be rendered as

```html
<picture>
  <source srcset="/dark/logo.svg" media="(prefers-color-scheme: dark)" />
  <img src="/logo.svg" alt="ACME Inc." />
</picture>
```

### `svg_sprite(sprite, link, options)`

Generate `<svg>` links.

```ruby
<%= svg_sprite :icons, :checkmark, class: "icon lg green" %>
```

This will be rendered as

```html
<svg class="icon lg green" role="presentation">
  <use href="/icons.svg#checkmark">
</svg>
```

This is more useful if you wrap it in your own helper.

```ruby
def icon(name, color = nil)
  svg_sprite :icons, name, class: "icon lg #{color}".rstrip
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/fnando/image_helpers. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the
[code of conduct](https://github.com/fnando/image_helpers/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ImageHelpers project's codebases, issue trackers,
chat rooms and mailing lists is expected to follow the
[code of conduct](https://github.com/fnando/image_helpers/blob/master/CODE_OF_CONDUCT.md).
