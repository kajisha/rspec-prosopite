# RSpec::Prosopite

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add rspec-prosopite

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install rspec-prosopite

## Usage

### perform_queries matcher

Use `perform_queries` matcher to detect N+1 query in your spec.

```ruby
it "N+1" do
  expect { suspicious_something }.to perform_queries
end
```

### allow_stack_paths

If you want to allow some N+1, use allow_stack_paths or ignore_queries, like this:

Except N+1 query in the method:
```ruby
expect { suspicious_something }.to perform_queries.allow_stack_paths([/method_name/])
```

Except N+1 query by SQL:
```ruby
expect { suspicious_something }.to perform_queries.ignore_queries([/SELECT \* FROM users/])
```

More details about `allow_stack_paths` and `ignore_queries`, see [prosopite](https://github.com/charkost/prosopite).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kajisha/rspec-prosopite.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
