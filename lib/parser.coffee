stream = require 'stream'
CodeStream = require './code-stream'
LineStream = require './line-stream'


module.exports =
class Parser
  constructor: (@delegate) ->

  parse: (code) =>
    stringStream = new stream.Readable()
    stringStream._read = (string) ->
      @push(string)
      @push(null)

    stringStream._read(code)
    stringStream.pipe(new LineStream()).pipe(new CodeStream(@delegate))
