describe('Chapter 7', () => {
  describe('#7.1 destructure', () => {
    it('array', () => {
      const [first, second, ...rest] = ['Philip', 'Jay', 'Fry'];
      expect(first).toBe('Philip');
      expect(second).toBe('Jay');
      expect(rest).toEqual(['Fry']);

      const [{inner: [,x]}] = [{inner: [1,2,3]}];
      expect(x).toBe(2);

      const [a = 1, b = 2, c] = ['a']
      expect(a).toBe('a')
      expect(b).toBe(2)
      expect(c).toBeUndefined()
    });

    it('object', () => {
      const {map:映射, filter:过滤, inc: 加一, isEven:偶数} = require('con.js');      expect(映射(加一, [1,2,3,4]).toString()).toBe('(2 3 4 5)')
      expect(过滤(偶数, [1,2,3,4]).toString()).toBe('(2 4)');

      const {outer: {inner: x}} = { outer: {inner: 3}};
      expect(x).toBe(3);

      const {a = 1, b = 2, c} = {a: 'a'}
      expect(a).toBe('a')
      expect(b).toBe(2)
      expect(c).toBeUndefined()
    });

    it('function', () => {
      console.log = jest.genMockFn()
      function awesomePrinter([first, ...rest]){
        console.log(first, rest)
      }
      awesomePrinter([1,2,3,4])
      expect(console.log).toBeCalledWith(1, [2,3,4])
    });
  });

  describe('#7.2', () => {
    it('arity', () => {
      function add(){
        switch(arguments.length){
        case 0: return 0;
        case 1: return arguments[0];
        case 2: return arguments[0] + arguments[1];
        default:
          let [first, ...rest] = arguments;
          return first + add.apply(null , rest);
        }
      }
      expect(add()).toBe(0)
      expect(add(1,2)).toBe(3)
      expect(add(1,2,3)).toBe(6)
    });
  });

  describe('#7.3', () => {
    it('#7.3.1 Literal Matching', () => {
      function fizzBuzz(i){
        var mod3 = i%3, mod5 = i%5
        if(mod3 == 0 && mod5 == 0){
          return 'FizzBuzz';
        }else if(mod3 == 0 && mod5 != 0){
          return 'Fizz';
        }else if(mod3 != 0 && mod5 == 0){
          return 'Buzz';
        }else if(mod3 !=0 && mod5 != 0) {
          return i;
        }
      }
      expect(fizzBuzz(5)).toBe('Buzz')
      expect(fizzBuzz(3)).toBe('Fizz')
      expect(fizzBuzz(15)).toBe('FizzBuzz')
      expect(fizzBuzz(16)).toBe(16)
    });
  });
});
