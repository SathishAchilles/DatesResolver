# DatesResolver
As the name suggests it splits overlapping date ranges in a neat object oriented way.

# How it does this
It consumes a collection of ruby objects of which each respond to :start_date and :end_date that are overlapping.
Normalizes them and splits them based on the overlaps.. returning again a collection of modified and cloned objects of the same type.



![Logic](https://raw.githubusercontent.com/SathishAchilles/DatesResolver/master/images/dates_resolver_logic.PNG?_sm_au_=iqM0KTfNWWQrH4kM)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dates_resolver'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dates_resolver

## Usage

Dates resolver marks the dates ranges by looking at the `:start_date` and `:end_date` attributes of each object.
So it is mandatory that the objects respond to these methods.

```ruby
require 'dates_resolver'
```

```ruby
DatesResolver::AR.new(date_range_overlapping_ar_objects).resolve
```

One of the simple usecases would be in Insurance sector, where users are prone to have multiple insurance policies with overlapping maturity periods. We could resolve the overlapping maturity periods of multiple insurance policies owned by the user and calculating the total premium amount for the user during that overlapping period.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dates_resolver. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DatesResolver project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/dates_resolver/blob/master/CODE_OF_CONDUCT.md).
