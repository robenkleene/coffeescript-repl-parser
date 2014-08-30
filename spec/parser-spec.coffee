Parser = require '../lib/parser.coffee'
th = require './lib/test-helper.coffee'
Delegate = require './lib/test-delegate.coffee'

describe "Parser", ->
  {code, parser} = []
  beforeEach ->
    delegate = new Delegate()
    parser = new Parser(delegate)
    code = th.readFixtureFile('file.coffee')

  it "runs", ->
    parser.parse(code)
