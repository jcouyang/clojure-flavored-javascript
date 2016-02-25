import _ from 'mori';
describe('Chapter 1', function() {
    beforeEach(() => {
      spyOn(console, 'log');
    });
  describe('#1.1.1 Programming Paradigm', function() {
    it('print 10 times 命令', function() {
      for (let i = 0; i < 10; i++) {
        console.log('命令', i);
      }
      expect(console.log.calls.length).toBe(10);
    });
  });
  describe('#1.1.2 Native functional javascript', function() {
    it('support function as arguments', function() {
      expect([1, 2, 3, 4].map((x)=>++x)).toEqual([2, 3, 4, 5]);
    });

    describe('mutable', function() {
      const array = [1, 2, 3, 4];
      const result = [];
      for (let i of array) {
        result.push(++i);
      }
      it('mutated the result array', function() {
        expect(result).toEqual([2, 3, 4, 5]);
      });
    });
  });

  describe('#1.1.4 Lexical Binding', function() {
    let Multipler = function(inc){
      this.inc = inc;
    };

    describe('self = this', function() {
      Multipler.prototype.multiple = function(numbers) {
        const self = this;
        return numbers.map(function(number){
          return self.inc * number;
        });
      };
      it('works', function() {
        expect(new Multipler(2).multiple([1, 2, 3, 4])).toEqual([2, 4, 6, 8]);
      });
    });

    describe('arrow function', function() {
      Multipler.prototype.multiple = function(numbers) {
        return numbers.map(number => number * this.inc);
      };
      it('works', function() {
        expect(new Multipler(2).multiple([1,2,3,4])).toEqual([2,4,6,8]);
      });
    });
  });

  describe('#1.1.6 Desctructure', () => {
    describe('eating oreo', function() {
      const dipMilk = jest.genMockFunction(),
          lip = jest.genMockFunction().mockReturnValue('wetMiddleAndButton'),
          eat = jest.genMockFn();

      describe('the old way', function() {
        const orea = ['top', 'middle', 'bottom'],
            top = orea.shift(), middleAndButton=orea,
            wetMiddleAndButton = dipMilk(middleAndButton),
            button = lip(wetMiddleAndButton);
        it('sucks', function() {
          eat([top, button]);
          expect(eat).toBeCalledWith(['top', 'wetMiddleAndButton'])
        });
      });

      describe('the es6 way', function() {
        const [top, ...middleAndButton] = ['top', 'middle', 'bottom'];
        const wetMiddleAndButton = dipMilk(middleAndButton);
        const button = lip(wetMiddleAndButton);
        it('is awesome', function() {
          eat([top, button]);
          expect(eat).toBeCalledWith(['top', 'wetMiddleAndButton']);
        });
      });
    });
  });

  describe('#1.2.1 Immutable', () => {
    describe('Array is Mutable', () => {
      let a = [1, 2, 3];
      a.push(4);
      it('a should be mutated', () => {
        expect(a).toEqual([1, 2, 3, 4]);
      });
    });
    describe('Vector is Immutable', () => {
      let a = _.vector(1, 2, 3);
      expect(_.conj(a, 4).toString()).toEqual('[1 2 3 4]');
    });
  });

  describe('#1.2.4 loop', () => {
    let a = [1, 2, 3, 4];
    let b = [4, 3, 2, 1];
    for (let i = 0; i < 4; i++) {
      a[i] += b[i];
    }
    expect(a).toEqual([5, 5, 5, 5]);
  });
});
