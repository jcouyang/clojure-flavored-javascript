describe('Chapter 8', function() {
  beforeEach(() => {
    spyOn(console, 'log');
  });
  describe('#8.1.2 Cocurrent modle of JS', function() {
    it('setTimeout callback',function(d) {
      function a(){
        console.log('a');
      }
      function b(){
        console.log('b');
      }
      function timeout(){
        console.log('timeout');
        d();
      }
      setTimeout(timeout,0);
      a();
      b();
      jest.runAllTimers()
      expect(console.log.mock.calls.length).toBe(3)
    })
  });
});
