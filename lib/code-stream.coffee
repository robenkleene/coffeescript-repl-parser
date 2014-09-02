stream = require 'stream'

module.exports =
class StreamParser extends stream.Writable
  MATCH_START_CODE_BLOCK = /^(?!\s)./
  MATCH_EMPTY_LINE = /^\s*$/

  constructor: (@delegate) ->
    super
    @currentCodeBlock = ""

  _write: (chunk, enc, next) ->
    code = chunk.toString()

    if code.match(MATCH_EMPTY_LINE)
      next()
      return

    if code.match(MATCH_START_CODE_BLOCK)
      if @currentCodeBlock.length > 0
        @delegate.handleCodeBlock(@currentCodeBlock)
      @currentCodeBlock = ""

    @currentCodeBlock = @currentCodeBlock + code + "\n"
    next()
