stream = require 'stream'

module.exports =
class LineStream extends stream.Transform

  constructor: (args) ->
    super({objectMode:true})

  _transform: (chunk, encoding, done) ->
    string = chunk.toString()
    if (@_lastLineData)
      string = @_lastLineData + string
    lines = string.split '\n'
    @_lastLineData = lines.splice(lines.length - 1, 1)[0]
    lines.forEach(@push.bind(@))
    done()

  _flush: (done) ->
    if (@_lastLineData)
      @push(@_lastLineData)
    @_lastLineData = null
    done()
