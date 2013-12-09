tunes
=====

## Getting Started

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
1. Install [Vagrant](http://downloads.vagrantup.com/)
1. Clone the project
1. Make your dev VM: `vagrant up`
1. SSH into VM and bootstrap it
  * `vagrant ssh`
  * `/vagrant/bootstrap.sh`
  * `export SOUNDCLOUD_KEY=[soundcloud key]` (should probably put it in .bash_profile)
  * `cd /vagrant; foreman start` - Rails server for API
  * `cd /vagrant/webapp; grunt server` - Express server for static assets and file watcher to recompile JS/CSS
1. In browser: `http://0.0.0.0:8000`

## DB Stuff

1. Download posgres.app (maintained by heroku)
2. run 'rake db:setup'
3. run 'rake db:migrate'

## App Organization

The application is composed of two separate parts, the API backend (Rails) and the HTML5 client (Ember served by Express). The client shouldn't assume anything about the backend except what's defined by the API. The Rails app code sits in the root of the repository. The frontend client code sits in `/webapp`. One weirdness is that `package.json`, which only applies to `/webapp`, sits in the root. This is because the Heroku buildpack for Node only searches in the root for `package.json`.

All API calls are in `/api`; any other URL paths are handled by the frontend client. In dev environments, the Express server (`/webapp/tasks/express-server.js`) handles all traffic and proxies `/api` traffic to the Rails server, which is why both `grunt server` and `foreman start` must be run. In prod environments, Rails handles all traffic serves both the API and the compiled version of the webapp client.

## New file boilerplate

[Loom](https://npmjs.org/package/loom) is a command-line tool that spits out
boilerplate for new files like routes, controllers, models, etc. It's installed
by npm into `/node_modules/loom`, and the `generate` binary is at
`/node_modules/loom/bin/generate`. You might want to adjust your `$PATH` or
create an alias. Ember Generator commands are
[here](https://github.com/rpflorence/loom-generators-ember)

```
generate model user name:string age:number
generate route about
```
Rails uses Single Table Inheritence for extending an ActiveRecord base model.

Class Song < ActiveRecord:Base
  ...

Class Remix < Song
  ...

Song and Remix will both refer to the same table.


# Soundcloud
## 404 issue
Seems to be related to user authentication and private sets.

[ref]http://stackoverflow.com/questions/18753879/soundcloud-api-resolve-method-404-error
