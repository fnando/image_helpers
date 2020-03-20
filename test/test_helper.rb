# frozen_string_literal: true

ENV["RAILS_ENV"] = "test"

require "bundler/setup"

require "rails/all"
require "image_helpers"

require "minitest/utils"
require "minitest/autorun"

require_relative "support/application"
