# Woodchuck

A lightweight log shipper for logstash written in Ruby.

Fair warning, it's a work in progress ;)

## Installation

Install as a gem:

    $ gem install woodchuck

And then execute:

    $ woodchuck
## Configuration

```ruby
watch "/var/log/postgresql/*"
```

## Usage
```bash
woodchuck --files /var/log/syslog,/var/log/apache/**/*,/var/log/nginx/*.log --output redis
```

### Options
```
* -h, --help      - Help!
* -l, --log-level - Log verbosity. [ debug, warn, info, error, fatal ]
* -p, --paths     - A comma-separated list of files to watch for changes (file globbing is accepted).
* -o, --output    - The output to send to [ stdout, redis ]
```
## Coming soon

* Handy config format for multiple files and outputs
* regular expressions (why not!)
* ZeroMQ and TCP output support
* Performance enhancements

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
