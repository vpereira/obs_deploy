# OBS Deploy tool

Simple tool to deploy OBS via zypper to our reference server

## Installation

Just run:

```ruby
gem 'obs_deploy'
```

## Usage

To be able to use it you will need an env file like:

```
ssh_server: xxx
user: xxx
product_version: yyyy
```

give this env file as parameter to `obs_deploy` and you are good to go:

`obs_deploy deploy -f env_file`
`obs_deploy running`
`obs_deploy available -f env_file`
`obs_deploy deploy -f env_file --dry-run`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vpereira/obs_deploy.
