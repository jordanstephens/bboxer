# Bboxer

I had a large number of SVGs with bad view boxes so I wrote this gem to batch update SVG view boxes to be equal to their bounding boxes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bboxer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bboxer

Don't forget to rehash if you're using rbenv

    $ rbenv rehash

## Usage

Use bboxer on the shell. Pass it a directory of SVGs (or list of directories) and it will recursively look for SVGs and process them. It will write output next to the original file appending `-updated` to the file name.

    $ bboxer path/to/svgs

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bboxer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
