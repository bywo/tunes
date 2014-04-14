tunes
=====

## Testing

Rspec, Guard and Spork are used for TDD on the Ruby app. This combination will start a local server and run specs when files changes are detected. Most of the configuration can be found in the `Guardfile` and  `spec_helper.rb`. Integration with terminal notifications via the `terminal-notifier-guard` gem.

To start test server: `$ bundle exec guard`

* may need to run `rake test:prepare` to init testing db


## Getting Started

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Install [Vagrant](http://www.vagrantup.com/downloads.html)
3. Clone the project
4. Make your dev VM: `vagrant up`
5. SSH into VM and bootstrap it
  * `vagrant ssh`
  * `/vagrant/bootstrap.sh`
  * `export SOUNDCLOUD_KEY=[soundcloud key]` (should probably put it in .bash_profile)
  * `cd /vagrant; foreman start` - Rails server for API
  * `cd /vagrant/webapp; grunt server` - Express server for static assets and file watcher to recompile JS/CSS
6. In browser: `http://0.0.0.0:8000`

## DB Stuff

1. Download posgres.app (maintained by heroku)
2. run 'rake db:setup'
3. run 'rake db:migrate'
4. run 'rake test:prepare'

If you you have an exsiting db:

1. `$ rake db:reset`
2. `$ rake db:seed`
3. `$ rake test:prepare`

## Users

- using the devise gem for user auth
- db seed depends on a 'secret' config file
  - Nothing in the '/secret' directory should be checked into version control
  - the credentials in this file should only be used to generate a test about
- see the seed file for example


## App Organization (TODO update)

The application is composed of two separate parts, the API backend (Rails) and the HTML5 client (Ember served by Express). The client shouldn't assume anything about the backend except what's defined by the API. The Rails app code sits in the root of the repository. The frontend client code sits in `/webapp`. One weirdness is that `package.json`, which only applies to `/webapp`, sits in the root. This is because the Heroku buildpack for Node only searches in the root for `package.json`.

All API calls are in `/api`; any other URL paths are handled by the frontend client. In dev environments, the Express server (`/webapp/tasks/express-server.js`) handles all traffic and proxies `/api` traffic to the Rails server, which is why both `grunt server` and `foreman start` must be run. In prod environments, Rails handles all traffic serves both the API and the compiled version of the webapp client.


```
generate model user name:string age:number
generate route about
```
Rails uses Single Table Inheritence for extending an ActiveRecord base model.

Class Song < ActiveRecord:Base
  ...

Class Remix < Song
  ...

Song and Remix will both refer to the same table. Generally you wont need to think too much about this.


# Soundcloud
## 404 issue
Seems to be related to user authentication and private sets.

[ref]http://stackoverflow.com/questions/18753879/soundcloud-api-resolve-method-404-error
