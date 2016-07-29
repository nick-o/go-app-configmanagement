[![Circle CI Build Status](https://circleci.com/gh/nick-o/go-app-configmanagement.svg?style=shield)](https://circleci.com/gh/nick-o/go-app-configmanagement)
### go-app-configmanagement
Cookbook to provision a simple 2-tier [Golang sample application](https://github.com/nick-o/go-app/).

# Requirements
This cookbook has been tested on the following platforms:
- Ubuntu 14.04

# Usage

### Web nodes
Include the go-app-configmanagement::default and go-app-configmanagement::nginx recipes in your nodes runlist to deploy the nginx reverse proxy:

```
{
  "name": "web",
  "run_list": [
    "recipe[go-app-configmanagement::default]",
    "recipe[go-app-configmanagement::nginx]"
  ]
}
```

### App nodes
Include the go-app-configmanagement::default and go-app-configmanagement::go_app recipes in your nodes runlist to deploy the Golang sample app:

```
{
  "name": "app-XX",
  "run_list": [
    "recipe[go-app-configmanagement::default]",
    "recipe[go-app-configmanagement::go_app]"
  ]
}
```

# Testing
The following Tests are being used for this cookbook:
- `foodcritic` and `rubocop` for style checking
- `test-kitchen` for integration testing

To manually invoke the tests, run `bundle exec rake test`.

The following requirements need to be satisfied for local testing:
- Vagrant
- VirtualBox
- Vagrant Bershelf Plugin

### Continuous integration
Circle CI has been set up to run continuous testing on this Repository. Integration testing it done using the kitchen-docker gem.

# Considerations

### Code Deployment
Code is 'deployed' via a `remote_file` resource that downloads the artifact from an S3 bucket. The artifact is uploaded to that bucket via a Job on Circle CI. While is not a perfect method for doing continuous deployments, it will certainly pick up any changes to the source code and make them available eventually.

### Unit Tests
Due to my lack of familiarity with rspec I have not written any unit tests for this cookbook. This is certainly something I would recommend doing as a next step.
