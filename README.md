[![Code Climate](https://codeclimate.com/github/kkirsche/medium-sdk-ruby/badges/gpa.svg)](https://codeclimate.com/github/kkirsche/medium-sdk-ruby) [![Test Coverage](https://codeclimate.com/github/kkirsche/medium-sdk-ruby/badges/coverage.svg)](https://codeclimate.com/github/kkirsche/medium-sdk-ruby/coverage)

# Medium SDK for Ruby

This repository contains the open source SDK for integrating Medium's API into your Ruby app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'medium'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install medium

## Usage

Create a client, then call commands on it.

```ruby
require 'medium'

# If you have a self-issued access token, you can create a new client directly:
client = Medium::Client.new integration_token: 'example_token'

# Get profile details of the user identified by the access token.
client.user.me
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Questions, comments, bug reports, and pull requests are all welcomed on Github at https://github.com/kkirsche/medium-sdk-ruby.

## Authors

* [Kevin Kirsche](https://github.com/kkirsche)
