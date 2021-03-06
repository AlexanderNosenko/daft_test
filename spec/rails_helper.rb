require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require "test_prof/recipes/rspec/let_it_be"
require 'module_scaffold'
# For multiple reasons better include in specific files
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods
  config.include ModuleScaffold::SpecSupport::SerializerHelpers, type: :serializer
  config.include ActiveJob::TestHelper

  config.after do |example|
    if example.metadata[:rswag]
      begin
        example.metadata[:response][:examples] = {
          'application/json' => JSON.parse(response.body, symbolize_names: true)
        }
      rescue
        nil
      end
    end
  end
end
