axis             = require 'axis'
rupture          = require 'rupture'
autoprefixer     = require 'autoprefixer-stylus'
browserify       = require 'roots-browserify'
browserifyShim   = require 'browserify-shim'
coffeeify        = require 'coffeeify'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

  extensions: [
    browserify
      files: 'assets/js/main.coffee'
      out: 'js/build.js'
      transforms: [browserifyShim, coffeeify]
  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]
    sourcemap: true

  jade:
    pretty: true
