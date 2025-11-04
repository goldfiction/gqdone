app=require './app.coffee'
assert=require 'assert'
tests=require 'gqtest'
it=tests.it

# note: need to create user.js from user.default.js

# dummy test for code integrity
it "should be able to run",(done)->
  done()

it "should be able to get abc",(done)->
  assert.equal app.abc,"abc"
  done()

it "should be able to do done",(done)->
  app.done("testing... code:001",done)

tests.doRun()