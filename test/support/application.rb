# frozen_string_literal: true

require "webpacker"

class App < Rails::Application
  def root
    Pathname.new(__dir__)
  end

  Webpacker.instance = Webpacker::Instance.new(
    config_path: root.join("config/webpacker.yml"),
    root_path: root
  )
end

class ApplicationController < ActionController::Base
  helper ImageHelpers
  helper Webpacker::Helper
end
