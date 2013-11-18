tunes
=====

## Getting Started

1. Clone the project
1. Get `keys.js` and place it at `/app/keys.js`
1. Install Node: `brew install node`
1. Install Grunt command-line: `npm install -g grunt-cli`
1. Install Node dependencies `npm install`
1. Install Bower `npm install -g bower`
1. Install Bower dependencies `bower install`
1. Run the server `grunt server`
1. Success! go to `http://0.0.0.0:8000`

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
