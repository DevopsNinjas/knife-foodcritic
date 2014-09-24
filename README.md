knife-foodcritic
================

A knife plugin that generates boiler plate code for developing and testing custom foodcritic rules

[![Build Status](https://travis-ci.org/DevopsNinjas/knife-foodcritic.svg?branch=master)](https://travis-ci.org/DevopsNinjas/knife-foodcritic)

Installation
------------

### Gem Install
`knife-foodcritic` is available on rubygems. Add the following to your `Gemfile`:

```ruby
gem 'knife-foodcritic'
```

or install the gem manually:

```bash
gem install knife-foodcritic
```

Foodcritic Rule Create
----------
This function lets you easily create the necessary lib, spec and cookbook files necessary to develop and test a new foodcritic rule.

#### Usage
```bash
knife foodcritic rule create ID [ --description DESCRIPTION ]
````

#### Example (Just passing in a rule ID)
```text
$ knife foodcritic rule create CUSTOM001
** Creating Custom001 at /Users/edmundd/Development/lightyear/chef-repo/foodcritic/lib/Fourth/CUSTOM001.rb
** Creating spec file at /Users/edmundd/Development/lightyear/chef-repo/foodcritic/spec/rules/CUSTOM001_spec.rb
** Cookbooks directory: /Users/edmundd/Development/lightyear/chef-repo/foodcritic/cookbooks
** Creating cookbook custom001
** Creating metadata for cookbook: custom001
** Creating README for cookbook: custom001
```

#### Example (Adding a rule description at creation time)
```text
$ knife foodcritic rule create CUSTOM001 --description "The best rule in the world"
** Creating Custom001 at /Users/edmundd/Development/lightyear/chef-repo/foodcritic/lib/Fourth/CUSTOM001.rb
** Creating spec file at /Users/edmundd/Development/lightyear/chef-repo/foodcritic/spec/rules/CUSTOM001_spec.rb
** Cookbooks directory: /Users/edmundd/Development/lightyear/chef-repo/foodcritic/cookbooks
** Creating cookbook custom001
** Creating metadata for cookbook: custom001
** Creating README for cookbook: custom001
```
