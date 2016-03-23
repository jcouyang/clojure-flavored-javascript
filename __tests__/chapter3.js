describe('Chapter3', () => {
  describe('#3.1.2 recursion or loop', () => {
    it('loop', () => {
      let i = 100;
      let threshold = Math.random() * 100;
      while(true) {
        if(i < 0) {
          console.log(i);
          break;
        }
        i = i - threshold;
      }
      expect(i<0).toBe(true);
    });

    it('recursion', () => {
      spyOn(console, 'log');
      function loop(i, threshold) {
        if(i < 0) {
          console.log(i);
          return
        }
        loop(i - threshold, threshold);
      }
      loop(100, Math.random() * 100);
      expect(console.log.calls[0].args[0]<0).toBe(true);
    });
  });

  describe('#3.3', () => {
    it('fact recursion', () => {
      function fact(n) {
        if(n==0) return 1;
        return n * fact(n-1);
      }
      expect(fact(5)).toBe(120);
    });

    it('fact tail recursion version', () => {
      function fact(n, acc=1) {
        if(n == 0) return acc;
        return fact(n-1, acc * n);
      }
      expect(fact(5)).toBe(120);
    });
  });

  describe('#3.4 Trampoline', () => {
    "http://jsbin.com/zapana/1/embed?js,console"
  });
});
