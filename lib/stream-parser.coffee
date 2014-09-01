stream = require 'stream'

module.exports =
class StreamParser extends stream.Writable
  MATCH_NEW_CODE_BLOCK = /^(?!\s)./

  constructor: (@delegate) ->
    super
    @currentCodeBlock = ""

  _write: (chunk, enc, next) ->
    code = chunk.toString()
    console.log  code
    # TODO skip blank lines

    if code.match(MATCH_NEW_CODE_BLOCK)
      @delegate.handleCodeBlock(@currentCodeBlock)
      @currentCodeBlock = ""
    else
      @currentCodeBlock.concat code

    next()
