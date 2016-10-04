# look_like matcher 

- This gem is a collection of rspec matchers, for writing wireframe tests.
- Such tests search for visual clues for detecting presence of a bug.
- Useful for writing sanity tests in higher environments, e.g. testing your fresh deploy to production.
- These can reuse your code for regression tests.  
- Meaningful assertion reports help in quick diagnosis of faults. 
- For example you can write test for fresh deployments to make sure the currency and language are correct by domain/user. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'look_like'
```

And then execute:

```bash
$ bundle install
```

## Usage
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
                              :select   => lambda{|expected|},
                              :match    => lambda{|actual, expected|} 
                          })
```


## Writing wireframe tests
In your feature file, define how your table should look like (visually) : 
```gherkin
Scenario: View employees detail table
  Given I am an admin
  Then  I should see employees table like
        |FirstName  |LastName   |  Salary   |Email  |
        |Magan      |Sharma     |  $200,00  |a@b.com|
```

In your steps, get table rows as array of array
```ruby
Then(/^I should see employees table like:$/) do |table_definition|
  table = homepage.open.employee_table
  expect(table).to look_like(table_definition)
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nishants/look_like. 


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

