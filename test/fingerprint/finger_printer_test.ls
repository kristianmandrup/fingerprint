require '../test_setup'

index           = require '../../'
fingerprint     = index.fingerprint
FingerPrinter   = fingerprint.FingerPrinter

describe 'FingerPrinter' ->
  var access-request

  finger-printer = (ar, debug = true) ->
    new FingerPrinter ar, debug

  before ->
    access-request := {user: {name: 'Kris'}, action: 'read'}

  describe 'fingerprint' ->
    specify 'has method access-hash' ->
      res = finger-printer(access-request).fingerprint!
      # console.log res
      res.should.eql 'ea4fd60a6dc4c0f9b0cc7637f7f5617e'


