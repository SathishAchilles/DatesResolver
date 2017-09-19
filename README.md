# What's Dates Resolver

As the name suggests it splits overlapping date ranges in a neat object oriented way

# How it does this
It consumes a collection of ActiveRecord objects with Date ranges that are overlapping and splits them based on the overlaps.. returns the splitted dates as ActiveRecords again

![Logic](https://raw.githubusercontent.com/SathishAchilles/DatesResolver/master/images/dates_resolver_logic.PNG?_sm_au_=iqM0KTfNWWQrH4kM)

Dates resolver marks the dates ranges by looking at the `:start_date` and `:end_date` attributes of each active record model.
So it is mandatory to have these two attributes for every active record model

# How to compile and install 

### If your planning to add it your gem file
> gem 'dates_resolver', '~> 0.0.1' 

#### If your planning to install separately 
> gem install dates_resolver

#### To Use it within your application
> require 'dates_resolver'

> DatesResolver.new(date_range_overlapping_ar_objects).resolve

# Contribution
Please raise a PR..

