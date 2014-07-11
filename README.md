# Rspec::ExitMatchers [WIP]

Rspec 3 matchers for `exit`.

## Installation

```ruby
gem 'rspec-exit_matchers'
```

## Usage

```ruby
# expect { my_code }.to exit_with_success
# expect { my_code }.to exit_with_failure
expect { my_code }.to exit_with_status(1)
expect { my_code }.to exit_with_status(0)
# expect { my_code }.to exit_with_any_status
# expect { my_code }.not_to exit_with_any_status
```

## Contributing

Yes, please.
