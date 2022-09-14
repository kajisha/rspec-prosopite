# frozen_string_literal: true

::RSpec::Matchers.define :perform_queries do
  supports_block_expectations

  chain :ignore_queries do |queries|
    Prosopite.ignore_queries = queries
  end

  chain :allow_stack_paths do |paths|
    Prosopite.allow_stack_paths = paths
  end

  match(notify_expectation_failures: true) do |actual|
    raise ArgumentError, "Block is required" unless actual.is_a?(Proc)

    begin
      Prosopite.scan { actual.call }
    ensure
      Prosopite.ignore_queries = []
      Prosopite.allow_stack_paths = []
    end
  end
end

::RSpec.configure do |config|
  config.before(:suite) do
    Prosopite.raise = true
  end
end
