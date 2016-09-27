# look_like matcher
This gem is a collection of rspec matchers, for writing wireframe tests.
These are useful for writing sanity tests in higher environments where we cannot control the data consumed by an app.
This can also be used in a production environment.
You can reuse your code/specs for regression tests.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'look_like'
```

And then execute:

    $ bundle install

## Usage
Following will result in error : 
```ruby
it "single word is different than two words" do
    expect("Sam").to look_like("Sam Dam")
end

# results in error
# expected  "Sam" (one word), 
# to look like "Sam Dam" (two words)

```
## Custom Matchers
```ruby

LookLike::Matchers.define({
                              :name     => :single_word,
                              :desc     => "single word",
                              :priority => 7,
                              :select   => lambda{|keyword|},
                              :match    => lambda{|actual, expected|} 
                          })
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nishants/look_like. 


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

