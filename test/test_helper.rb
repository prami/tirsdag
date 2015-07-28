ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def assert_saves(model)
    assert model.save, "Cannot save #{model.class.name}#. Errors:\n  " + model.errors.full_messages.join("\n  ")
  end
end
