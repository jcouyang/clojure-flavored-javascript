import when from 'when';
describe('Chapter 7', () => {
  describe('#7.1.1 promise', () => {
    it('promise', () => {
      spyOn(console, 'log');
      const defered = when.defer();
      setTimeout(_ => defered.resolve(1 + 1), 1000);
      defered.promise.then(_ => {
        console.log(_);
      });
      jest.runAllTimers();
      expect(console.log).toHaveBeenCalledWith(2);
    });

    it('monadic promise', () => {
      spyOn(console, 'log');
      when.promise(resolve => setTimeout(_ => resolve(1), 1000))
        .then(value => (
          when.promise(resolve => setTimeout(_ => resolve(value + 1), 1000))
        ))
        .then(_ => console.log(_));
      jest.runAllTimers();
      expect(console.log).toHaveBeenCalledWith(2);
    });

    it('higher order promise', () => {
      const data = [when(1), when(2), when(3), when(4)];
      const double = data.map(_ => _ * 2);
      expect(double).toEqual[NaN,NaN,NaN,NaN]
      when.map(data, _ => _ * 2).then((value)=>{
        expect(value).toEqual([2, 4, 6, 8])
      })
      jest.runAllTimers()
    });
  });

  describe('#7.2 Monad', () => {
    function Just(val){
      this.value = val;
    }
    describe('Functor', () => {
      Just.prototype.fmap = function(f) {
        return new Just(f(this.value));
      }
      Just.of = function(value) {
        return new Just(value)
      }
      it('fmap', () => {
        const f = x => x + 'b';
        const a = 2;
        const fa = Just.of(a);
        const fb = fa.fmap(f);
        expect(fb.value).toBe('2b');
        expect(
          fb instanceof Just
        ).toBe(true);
      });
      it('Array fmap', () => {
        Array.prototype.fmap = Array.prototype.map;
        expect(
          [1, 2, 3].fmap(x => x)
        ).toEqual([1, 2, 3]);
        const f = x => x + 2
        const g = x => x * 2
        expect(
          [1, 2, 3].fmap(x => f(g(x)))
        ).toEqual([4, 6, 8]);
        expect(
          [1, 2, 3].fmap(g).fmap(f)
        ).toEqual([4, 6, 8]);
      });
    });

    describe('Applicative', () => {
      Just.prototype.ap = function(container){
        return container.fmap(this.value);
      }
      it('ap', () => {
        const fplus2 = Just.of(x => x + 2);
        expect(
          fplus2.ap(Just.of(3))
            .value
        ).toBe(5)
      });

      it('law', () => {
        expect(
          Just.of(x => x).ap(Just.of(3))
        ).toEqual(Just.of(3));

        expect(
          Just.of(x => x + 1).ap(Just.of(2))
        ).toEqual(Just.of((x => x + 1)(2)))

        const y = 'anything';
        expect(
          Just.of(x => y).ap(Just.of(3))
        ).toEqual(
          Just.of(f => f(3)).ap(Just.of(x => y))
        )
      });
    });

    describe('Monoid', () => {
      function Sum(value) {
        this.value = value;
      }
      Sum.prototype = Just.prototype;
      Sum.prototype.append = function(anotherSum){
        return anotherSum.fmap(value => this.value + value);
      }
      Sum.of = function(value) {
        return new Sum(value);
      }
      Sum.empty = Sum.of(0);

      it('sum of numbers', () => {
        expect(
          [Sum.of(1), Sum.of(2), Sum.of(3), Sum.of(4), Sum.of(5)]
            .reduce((_1,_2) => _1.append(_2))
        ).toEqual(
          Sum.of(15)
        )
      });

      it('law', () => {
        expect(
          Sum.empty.append(Sum.of(2))
        ).toEqual(Sum.of(2));

        expect(
          Sum.of(1).append(Sum.of(2)).append(Sum.of(3))
        ).toEqual(
          Sum.of(1).append(Sum.of(2).append(Sum.of(3)))
        )
      });
    });

    describe('Monad', () => {
      it('promise', () => {
        expect(
          Just.of(x=>2/x).ap(Just.of(x=>x+1).ap(Just.of(0)))
        ).toEqual(
          Just.of(2)
        )
      });

      it('functor', () => {
        expect(
          Just.of(0).fmap(x => x + 1).fmap(x => 2 / x)
        ).toEqual(
          Just.of(2)
        )
      });

      it('exception', () => {
        expect(function(){
          Just.of(undefined)
            .fmap(x => x.value)
            .fmap(x => x + 1)
            .fmap(x => 2 / x)
        }).toThrow();
      });

      function Nothing(){};
      Nothing.prototype.fmap = function(){
        return this;
      }
      let nothing = new Nothing;

      it('Nothing', () => {
        expect(function(){
          Just.of(undefined)
          .fmap(x => {
            if (x.value)
              return Just.of(x.value)
            else
              return nothing
          })
          .fmap(x => x + 1)
          .fmap(x => 2 / x)
        }).toThrow()
      });

      it('need to change all fmap', () => {
        expect(
          Just.of(undefined)
            .fmap(x => {
              if (x)
                return Just.of(x.value)
              else
                return nothing
            })
            .fmap(x => x.fmap(y => y + 1))
            .fmap(x => x.fmap(y => 2 / y))
        ).toEqual(Just.of(nothing))

        expect(
          Just.of({value: 0})
            .fmap(x => {
              if (x)
                return Just.of(x.value)
              else
                return nothing
            })
            .fmap(x => x.fmap(y => y + 1))
            .fmap(x => x.fmap(y => 2 / y))
        ).toEqual(Just.of(Just.of(2)))
      })

      Just.prototype.flat = function(){
        return this.value
      }
      Just.prototype.flatmap = function(f){
        return this.fmap(f).flat();
      }
      Nothing.prototype.flatmap = Nothing.prototype.fmap
      nothing = new Nothing;

      it('flatmap', () => {
        expect(
          Just.of({value: 0})
            .flatmap(x => {
              if (x)
                return Just.of(x.value)
              else
                return nothing
            })
            .fmap(x => x + 1)
            .fmap(x => 2 / x)
        ).toEqual(Just.of(2))
      });
    });

  });
});
