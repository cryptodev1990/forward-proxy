# ForwardProxy

Ruby Forward Proxy implemented with only standard library.

```
$ forward-proxy --binding 0.0.0.0 --port 3182 --threads 2
[2021-01-14 19:37:47 +1100] INFO Listening 0.0.0.0:3182
[2021-01-14 19:38:24 +1100] INFO CONNECT raw.githubusercontent.com:443 HTTP/1.1
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'forward-proxy'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install forward-proxy

## Usage

### CLI

```
forward-proxy
```

```
Usage: forward-proxy [options]
    -p, --port=PORT                  Bind to specified port. Default: 9292
    -b, --binding=BINDING            Bind to the specified IP. Default: 127.0.0.1
    -t, --threads=THREADS            Specify the number of client threads. Default: 32
    -h, --help                       Prints this help
```

### Library

```
require 'forward_proxy'

proxy = ForwardProxy::Server.new(
  bind_address: "127.0.0.1",
  bind_port: 3000
)

proxy.start
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/forward-proxy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/forward-proxy/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ForwardProxy project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/forward-proxy/blob/master/CODE_OF_CONDUCT.md).
