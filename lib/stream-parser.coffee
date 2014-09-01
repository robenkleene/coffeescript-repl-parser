stream = require 'stream'

module.exports =
class StreamParser extends stream.Writable
  constructor: (@delegate) ->
    super

  _write: (chunk, enc, next) ->
    @delegate.handleCodeBlock(chunk.toString())
    next()

  
