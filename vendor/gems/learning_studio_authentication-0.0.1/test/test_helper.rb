if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start do
    add_filter 'test'
    command_name 'Minitest'
  end
end

require 'factory_girl'
require 'minitest'
require 'minitest/unit'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/reporters'
require 'learning_studio_authentication'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new(:color => true)
FactoryGirl.find_definitions

module LearningStudioAuthentication
  class TestHelper
    class << self
      def delay_in_seconds(delay)
        sleep(delay)
      end
    end
  end
end
