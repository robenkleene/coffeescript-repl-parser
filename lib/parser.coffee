stream = require 'stream'
Lazy = require 'lazy'
# StreamParser = require './stream-parser'

module.exports =
class Parser
  constructor: (@delegate) ->

  parse: (code) =>
    stringStream = new stream.Readable()
    stringStream._read = (string) ->
      @push(string)
      @push(null)

    stringStream._read(code)
    @parseStream(stringStream)

  parseStream: (stream) =>
    new Lazy(stream).lines.forEach (line) =>
      console.log line.toString()
