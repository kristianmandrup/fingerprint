require '../test_setup'

index           = require '../../'
fingerprint     = index.fingerprint
FingerPrinter   = fingerprint.ObjectFingerPrint

describe 'ObjectFingerPrint' ->
  access-request = {}

  finger-printer = (ar, debug = true) ->
    new FingerPrinter ar, debug

  before ->
    access-request.simple =
      subject: 'Book'

    access-request.advanced :=
      subject: 'Book'
      fingerprint: ->
        'book'

    access-request.hash :=
      subject: 'Book'
      hash: ->
        'a book'

  describe 'fingerprint' ->
    specify 'makes a fingerprint' ->
      res = finger-printer(access-request.simple).fingerprint!
      # console.log res
      res.should.eql "{\"subject\":\"Book\"}"

    context 'object has its own fingerprint method' ->
      specify 'uses object fingerprint function' ->
        res = finger-printer(access-request.advanced).fingerprint!
        res.should.eql "book"

    context 'object has its own hash method' ->
      specify 'uses object hash function' ->
        res = finger-printer(access-request.hash).fingerprint!
        res.should.eql "a book"
