// Generated by LiveScript 1.2.0
(function(){
  var index, fingerprint, FingerPrinter;
  require('../test_setup');
  index = require('../../');
  fingerprint = index.fingerprint;
  FingerPrinter = fingerprint.ArrayFingerPrint;
  describe('ArrayFingerPrint', function(){
    var accessRequest, fingerPrinter;
    fingerPrinter = function(ar, debug){
      debug == null && (debug = true);
      return new FingerPrinter(ar, debug);
    };
    before(function(){
      return accessRequest = ['hello', 'goodbye'];
    });
    return describe('fingerprint', function(){
      return specify('makes a fingerprint', function(){
        var res;
        res = fingerPrinter(accessRequest).fingerprint();
        return res.should.eql('hello.goodbye');
      });
    });
  });
}).call(this);
