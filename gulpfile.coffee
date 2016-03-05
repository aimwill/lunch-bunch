# Dependencies
gulp = require 'gulp'
del = require 'del'
config = require './gulp/config.coffee'

# Cleans your output directory
gulp.task 'del', ->
  del config.path, force: true

# Process SASS
require './gulp/sass.coffee'

# Process TypeScript
require './gulp/ts.coffee'

# Process Jade
require './gulp/jade.coffee'

# Process images
require './gulp/images.coffee'

# Server
require './gulp/server.coffee'

# Tests
# require './gulp/test.coffee'

# Karma TDD
# gulp.task 'tdd', [
#   'default'
#   'test'
# ]

# For one-time builds to CI systems
gulp.task 'ci', [
  'jade'
  'sass'
  'ts'
  'images'
  # 'e2e'
]

gulp.task 'default', [
  'jade'
  'sass'
  'ts'
  'images'
  'serve'
], ->
  config.watching = true