import _ from 'con.js';
describe('Chapter 2', function() {
    beforeEach(() => {
      spyOn(console, 'log');
    });
  describe('#2.1.1 Vector', function() {
    let vec = mori.vector(1, 2, 3, 4);
    it('get', () => {
      expect(_.get(vec, 0)).toBe(1);
    });

    it('get like javascript', () => {
      expect(vec.get(0)).toBe(1);
    });

    it('immutable conj', () => {
      expect(_.conj(vec, 5).toString()).toBe("[1 2 3 4 5]");
      expect(vec.toString()).toBe("[1 2 3 4]");
    });

    it('js is mutable', () => {
      let array = [1,2,3,4]
      expect(array.push(5)).toEqual(5);
      expect(array).toEqual([1, 2, 3, 4, 5]);
    });

    it('pop element', () => {
      expect(_.pop(vec).toString()).toBe("[1 2 3]");
      expect(vec.toString()).toBe("[1 2 3 4]");
    });

    it('get first and rest', () => {
      expect(_.first(vec)).toBe(1);
      expect(_.rest(vec).toString()).toBe("(2 3 4)");
    });

    it('subvec', () => {
      expect(_.subvec(vec, 1).toString()).toBe('[2 3 4]');
      expect(_.subvec(vec, 1, 2).toString()).toBe('[2]');
      expect(vec.toString()).toBe('[1 2 3 4]');
    });
  });

  describe('#2.1.2Map', () => {
    it('ES6 Map', () => {
      let m0 = mori.hashMap('零', 0, '壹', 1);
      expect(_.get(m0, "零")).toBe(0);
      let m1 = mori.assoc(m0, mori.vector(1, 2), 2);
      expect(m0.toString()).toBe('{"零" 0, "壹" 1}');
      expect(_.get(m1, _.vector(1, 2))).toBe(2);
    });

    it('can assoc and conj vector', () => {
      let m0 = mori.hashMap('零', 0, '壹', 1);
      expect(
        _.assoc(_.vector(1, 2, 3), 1, 8)
          .toString()
      ).toBe('[1 8 3]');
      expect(
        _.conj(m0, _.vector("foo", "bar"))
          .toString()
      ).toBe('{"零" 0, "壹" 1, "foo" "bar"}')
    });
  });

  describe('#2.1.3 Combinator', () => {
    describe('map', () => {
      const oreoPack = [101, 101, 101, 101];
      const lip = (oreo) => 11;
      it('for loop', () => {
        let lipedOreoPack = [];
        for (let oreo of oreoPack){
          lipedOreoPack.push(lip(oreo));
        }
        expect(lipedOreoPack).toEqual([11, 11, 11, 11]);
      });

      it('map', () => {
        expect(
          oreoPack.map(lip)
        ).toEqual([11, 11, 11, 11]);
        expect(
          _.map(lip, oreoPack)
            .toString()
        ).toEqual('(11 11 11 11)');
      });

      it('predicate', () => {
        expect(
          _.filter(mori.isEven, [1, 2, 3, 4, 5])
            .toString()
        ).toBe('(2 4)');

        expect(
          [1, 2, 3, 4, 5].filter(x => x%2 == 0)
        ).toEqual([2, 4]);
      });
    });
    describe('reduce', () => {
      it('reduce vector and map', () => {
        expect(
          _.reduce((a, b) => a + b, 0, [1, 2, 3, 4, 5])
        ).toBe(15);

        expect(
          _.reduce((acc, [key, val]) => (_.assoc(acc, key, val + 1)),
                   _.hashMap(),
                   _.toClj({a: 1, b: 2, c: 3}))
            .toString()
        ).toBe('{"a" 2, "b" 3, "c" 4}');
      });
    });

    describe('take n drop', () => {
      let s = _.range();
      it('take first nth from infinit seq', () => {
        expect(_.take(10, s).toString()).toBe('(0 1 2 3 4 5 6 7 8 9)');
      });

      it('takeWhile', () => {
        const futuramaCast = [
          {
            name: "Philip Fry",
            date: "1974-8-14",
          },{
            name: "Turanga Leela",
            date: "2974-12-3",
          },{
            name: "Hubert J. Farnsworth",
            date: "2841-4-9",
          },{
            name: "Bender Bending Rodríguez, Sr.",
            date: "2996"
          },{
            name: "Amy Wong",
            date: "2978-5-4",
          }
        ]
        const notFromFuture = (who) => Date.parse(who.date) < new Date();
        expect(
          _.takeWhile(notFromFuture, futuramaCast)
            .toString()
        ).toBe('(#js {:name "Philip Fry", :date "1974-8-14"})');

        expect(
          _.dropWhile(notFromFuture, futuramaCast)
            .toString()
        ).toBe('(#js {:name "Turanga Leela", :date "2974-12-3"} #js {:name "Hubert J. Farnsworth", :date "2841-4-9"} #js {:name "Bender Bending Rodríguez, Sr.", :date "2996"} #js {:name "Amy Wong", :date "2978-5-4"})');
      });
    });
  });

  describe('#2.3.1', () => {
    it('Prestige', () => {
      const birdInACage = [{name: 'tweety'}];
      const magic = cage => cage[0] = {name: '翠花'};
      magic(birdInACage);
      expect(birdInACage).toEqual([{name: '翠花'}]);
    });

    it('happy immutable world', () => {
      const birdInACage = [{name: 'tweety'}];
      const magic = (birdInCage) => birdInCage.map(bird => ({
        name:'翠花'
      }));
      const anotherBirdInTheCage = magic(birdInACage);
      expect(anotherBirdInTheCage).toEqual([{name: '翠花'}]);
      expect(birdInACage).toEqual([{name:'tweety'}]);
    });
  });

  describe('#2.3.2 referential transparent', () => {
    it('fib', () => {
      function fib(n){
        switch (n) {
        case 0: return 1
        case 1: return 1
        default:
          return fib(n-1)+fib(n-2);
        }
      }
      expect(fib(30)).toBe(1346269);
    });

    it('memoize fib', () => {
      const fib = _.memoize(function(n){
        switch (n) {
        case 0: return 1
        case 1: return 1
        default:
          return fib(n-1)+fib(n-2);
        }
      });
      expect(fib(30)).toBe(1346269);
    });
  });

  describe('#2.3.4 concurrent', () => {
    it('mutable in concurrent', () => {
      function charge(order,callback){
        console.log(callback);
        setTimeout(() => callback(order), 100);
      }
      // 假设熊孩子喝牛奶只需要99ms（可能熊孩子是闪电侠）
      function drinkMilkThenChange(order){
        setTimeout(()=>order.push({name: 'R2D2', price: 99999}),
                   99);
      }
      // 打印发票
      let printReceipt = jest.genMockFn();
      // 熊孩子买了两个东西
      let order = [{name:'kindle',price:99}, {name:'drone', price:299}];
      // 熊孩子结账
      charge(order, printReceipt);
      // 熊孩子喝了杯牛奶后过来修改订单
      drinkMilkThenChange(order);
      expect(order).toEqual([{name:'kindle',price:99}, {name:'drone', price:299}]);
      jest.runAllTimers();
      expect(order).toEqual([{name:'kindle',price:99}, {name:'drone', price:299}, {name: 'R2D2', price: 99999}]);
      expect(printReceipt).toBeCalledWith([{name:'kindle',price:99}, {name:'drone', price:299}, {name: 'R2D2', price: 99999}]);
    });

    it('mutable in concurrent', () => {
      function charge(order,callback){
        console.log(callback);
        setTimeout(() => callback(order), 100);
      }
      // 假设熊孩子喝牛奶只需要99ms（可能熊孩子是闪电侠）
      function drinkMilkThenChange(order){
        setTimeout(() => _.conj(order, {name: 'R2D2', price: 99999}),
                   99);
      }
      // 打印发票
      let printReceipt = jest.genMockFn();
      // 熊孩子买了两个东西
      let order = mori.vector({name: 'kindle', price: 99},
                              {name: 'drone',  price: 299});
      // 熊孩子结账
      charge(order, printReceipt);
      // 熊孩子喝了杯牛奶后过来修改订单
      drinkMilkThenChange(order);
      expect(order.toString()).toBe('[#js {:name "kindle", :price 99} #js {:name "drone", :price 299}]');
      jest.runAllTimers();
      expect(order.toString()).toEqual('[#js {:name "kindle", :price 99} #js {:name "drone", :price 299}]');
    });
  });

  describe('#2.4.1 lazy seq', () => {
    const dipMilk = _.identity;
    const lip = ([middle, bottom]) => bottom;
    function lipMiddle(oreo){
      let wetOreo = dipMilk(oreo);
      let [top, ...middleBottom] = wetOreo;
      let bottom = lip(middleBottom);
      return [top, bottom];
    }
    it('lodash oreo eater', () => {
      let eat = jest.genMockFn();
      let _ = require('lodash');
      let oreoPack = _.range(10)
            .map(x => ["top", "middle", "bottom"]);
      let wetOreoPack = _.map(oreoPack, lipMiddle);
      _.each(wetOreoPack, eat);
      expect(eat.mock.calls.length).toBe(10);
    })

    it('mori oreo eater', () => {
      let eat = jest.genMockFn();
      let oreoPack = _.repeat(["top", "middle", "bottom"]);
      let wetOreoPack = _.map(lipMiddle, oreoPack);
      // // 条都塞好了，现在该吃了，假设我吃3块
      _.each(_.take(3, wetOreoPack), eat);
      expect(eat.mock.calls.length).toBe(3);
    });
  });
});
