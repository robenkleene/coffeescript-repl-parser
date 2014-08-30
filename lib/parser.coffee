module.exports =
class Parser
  constructor: (@delegate) ->

  parse: (code) =>
    @delegate.handleCodeBlock(code)
