require '../test_setup'

expect = require 'chai' .expect

index = require '../../'
Normalizer = index.util.Normalizer

describe 'Normalizer' ->
  var normalizer, args, normalized-args

  before ->
    normalized-args := user: 'a', action: 'b', subject: 'c'

  describe.only 'initialize(@args)' ->
    context 'with object' ->
      before ->
        args := user: 'a', action: 'b', subject: 'c'
        normalizer := new Normalizer args

      specify.only 'sets args as Object' ->
        expect(normalizer.args).to.eql [args]

      describe 'object' ->
        # @args if typeof! @args.0 is 'Object'
        specify 'returns args' ->
          expect(normalizer.object!).to.eql args

      describe 'normalized' ->
        specify 'normalized args' ->
          expect(normalizer.normalized!).to.eql normalized-args

  describe 'initialize(@args)' ->
    context 'with object in array' ->
      before ->
        args := user: 'a', action: 'b', subject: 'c'
        normalizer := new Normalizer [args]

      specify 'sets args as Object' ->
        normalizer.args.should.eql [args]

      describe 'object' ->
        # @args if typeof! @args.0 is 'Object'
        specify 'array args' ->
          normalizer.object!.should.eql args

      describe 'normalized' ->
        specify 'normalized args' -> ->
          normalizer.normalized!.should.eql normalized-args

  describe 'initialize(@args)' ->
    context 'with array' ->
      before ->
        args := ['a', 'b', 'c']
        normalizer := new Normalizer args
        normalized-args := action: 'a', subject: 'b', ctx: 'c'

      specify 'sets args as array' ->
        normalizer.args.should.eql args

      describe 'normalized' ->
        # @object! or @create-object!
        specify 'normalized args' ->
          normalizer.normalized!.should.eql normalized-args

      describe 'create-object' ->
        # lo.extend(@base-obj!, ctx: @args.3) if @args.3
        specify 'extends incl ctx' ->
          normalizer.create-object!.should.eql normalized-args

      describe 'base-obj' ->
        # {action: @args.1, subject: @args.2}
        specify 'base hash excl ctx' ->
          normalizer.base-obj!.should.eql action: 'a', subject: 'b'

    context 'with user' ->
      before ->
        args := ['a', 'b', 'c']
        normalizer := new Normalizer(args).set-user 'user'
        normalized-args := user: 'user', action: 'a', subject: 'b', ctx: 'c'

    describe 'normalized' ->
      # @object! or @create-object!
      specify 'normalized args' ->
        normalizer.normalized!.should.eql normalized-args

  describe 'initialize(@args)' ->
    context 'with mixed array' ->
      before ->
        args := [ 'write', { obj: { title: 'hello' }, title: 'hello' } ]
        normalizer := new Normalizer(args).set-user 'user'
        normalized-args := user: 'user', action: 'write', subject: { obj: { title: 'hello' }, title: 'hello' }

    describe 'normalized' ->
      # @object! or @create-object!
      specify 'normalized args' ->
        normalizer.normalized!.should.eql normalized-args

