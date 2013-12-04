tunes
=====

## Getting Started

1. Install VirtualBox
1. Install Vagrant
1. Clone the project
1. Make your dev VM: `vagrant up`
1. SSH into VM and bootstrap it
  * `vagrant ssh`
  * `bash /vagrant/bootstrap.sh`
1. In VM: `cd /vagrant; foreman start`
1. In browser: `http://0.0.0.0:4567`

## DB Stuff

1. Download posgres.app (maintained by heroku)
2. run 'rake db:setup'
3. run 'rake db:migrate'


## Frontend stuff

1. Get `keys.js` and place it at `/app/keys.js`

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
