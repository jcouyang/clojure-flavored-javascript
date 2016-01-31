const mori = require('con.js')
require("babel-polyfill");
const {async} = require('con.js/async');
describe('Chapter 8', function() {

  describe('#8.1.2 Cocurrent modle of JS', function() {
    beforeEach(() => {
      spyOn(console, 'log');
    });

    it('setTimeout callback',function() {
      function a(){
        console.log('a');
      }
      function b(){
        console.log('b');
      }
      function timeout(){
        console.log('timeout');
      }
      setTimeout(timeout,0);
      a();
      b();
      jest.runAllTimers()
      expect(console.log.calls.length).toBe(3)
      expect(console.log.calls[2].args[0]).toBe('timeout')
    })
  });
  describe('#8.3 CSP https://jsbin.com/savepe/6/edit?js,console', () => {
  });
  describe('#8.4.1 core.async', () => {
    describe('alts', function() {
      it('race channel', function(done) {
        var c1 = async.chan()
        var c2 = async.chan()

        async.doAlts(function(v) {
          expect(mori.get(v, 0)).toBe('c1')
          expect(mori.equals(c1, v.a(1))).toBe(true)
        },[c1,c2])
        async.put(c1, 'c1')
        async.put(c2, 'c2')
        jest.runAllTimers();
      })

      it('race promise channel', function(done) {
        var c1 = async.chan()
        var c2 = async.chan()

        async.alts([c1,c2])
          .then(function(v) {
            expect(mori.a(v, 0)).toBe('c1')
            expect(mori.equals(c1, v.a(1))).toBe(true)
          })
        async.put$(c1, 'c1')
        async.put$(c2, 'c2')
        jest.runAllTimers();
      })
    })
  });
  describe('#8.4.2 async function', () => {
    it('run a ping pong game', (done) => {
      // node async/async-csp.js
    });
  });
});
