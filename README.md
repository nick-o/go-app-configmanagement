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
Code is 'deployed' via a `remote_file` resource that downloads the artifact from an S3 bucket. The artifact is uploaded to that bucket via a Job on Circle CI. While is not a perfect method for doing continuous deployments, it will certainly pick up any changes to the source code and make them available eventually:

```
$ nano main.go
<modifying source code>
$ git diff
diff --git a/main.go b/main.go
index 2de22c8..7c78933 100644
--- a/main.go
+++ b/main.go
@@ -7,7 +7,7 @@ import (

 func handler(w http.ResponseWriter, r *http.Request) {
         h, _ := os.Hostname()
-        fmt.Fprintf(w, "Hi there, I'm served from node: %s!", h)
+        fmt.Fprintf(w, "Hello there, I'm being served from node: %s!", h)
 }

 func main() {
$ git add main.go
$ git commit -m "slight text change"
[master 633a39c] slight text change
 1 file changed, 1 insertion(+), 1 deletion(-)
$ git push origin master
Counting objects: 3, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 313 bytes | 0 bytes/s, done.
Total 3 (delta 2), reused 0 (delta 0)
To git@github.com:nick-o/go-app.git
   4a6322e..633a39c  master -> master
$ while true; do curl 54.229.27.136;echo; sleep 60;done
Hi there, I'm served from node: app-01!
Hi there, I'm served from node: app-02!
Hi there, I'm served from node: app-01!
Hi there, I'm served from node: app-02!
Hi there, I'm served from node: app-01!
Hi there, I'm served from node: app-02!
Hi there, I'm served from node: app-01!
Hi there, I'm served from node: app-02!
Hi there, I'm served from node: app-01!
Hi there, I'm served from node: app-02!
Hi there, I'm served from node: app-01!
Hello there, I'm being served from node: app-02!
Hello there, I'm being served from node: app-01!
```

### Unit Tests
Due to my lack of familiarity with rspec I have not written any unit tests for this cookbook. This is certainly something I would recommend doing as a next step.
