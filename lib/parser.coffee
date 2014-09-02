stream = require 'stream'
Lazy = require 'lazy'
# StreamParser = require './stream-parser'

module.exports =
class Parser
  MATCH_START_CODE_BLOCK = /^(?!\s)./
  MATCH_EMPTY_LINE = /^\s*/
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
      if line.MATCH_EMPTY_LINE
        return
      # console.log line.toString('utf8')
      console.log line.toString()
      # console.log  line
      # console.log  line.length
      # code = line.toString()
      # @delegate.handleCodeBlock(code)
      # console.log line.toString()
