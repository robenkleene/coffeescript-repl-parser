stream = require 'stream'
StreamParser = require './stream-parser'

module.exports =
class Parser
  constructor: (@delegate) ->

  parse: (code) =>
    stringStream = new stream.Readable()
    stringStream._read = (string) ->
      @push(string)
      @push(null)

    stringStream._read(code)
    stringStream.pipe new StreamParser(@delegate)
