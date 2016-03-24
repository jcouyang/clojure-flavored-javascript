import _ from 'mori';
describe('Chapter 4', () => {
  const data = [{name:'马儒',sex:'male'},
                {name:'全蛋',sex:'male'},
                {name:'连顺',sex:'female'}];

  describe('#4.1 whats wrong with underscore', () => {
    const _ = require('lodash');
    it('chain filter and map', () => {
      expect(
        _(data).filter(d => d.sex=='male')
          .map(d => d.name)
          .value()
      ).toEqual(["马儒", "全蛋"]);
    });

    it('compose map.filter', () => {
      expect(
        _.map(
          _.filter(data, d => d.sex == 'male'),
          d => d.name)
      ).toEqual(["马儒", "全蛋"]);
    });

    it('filter female', () => {
      expect(
        _(data).filter(d => d.sex=='female')
          .map(d => d.name)
          .value()
      ).toEqual(["连顺"]);
    });

    it('getNameBySex', () => {
      function getNameBySex(data, sex){
        return _(data).filter(d => d.sex == sex)
          .map(d => d.name)
          .value()
      }
    });

    it('see how ramda doing', () => {
      const R = require('ramda');
      const getMaleName = R.compose(
        R.map(d => d.name),
        R.filter(d => d.sex == 'male'));
      expect(getMaleName(data)).toEqual(["马儒", "全蛋"]);
    });

    it('closure', () => {
      const Rfilter = function(predicate){
        return function(data){  // <- clojure (ref:closure)
          return _.filter(data, predicate);
        }
      }
      expect(Rfilter(d => d.sex == 'male')(data)
             .map(d => d.name)).toEqual(["马儒", "全蛋"]);
    });
  });

  describe('#4.3 Transducer', () => {
    describe('reducer', () => {
      it('reduce', () => {
        expect(
          _.reduce(_.sum, 0, _.map(_.inc, [1, 2, 3]))
        ).toEqual(9)
        // 2+3+4
      })

      it('transform', () => {
        function map(fn){
          return function(reduceFn){
            return function(result, input){
              return reduceFn(result, fn(input))
            }
          }
        }
        expect(
          _.reduce(map(_.inc)(_.sum), 0, [1, 2, 3])
        ).toBe(9);
      });

      it('implementing reducer', () => {
        function map(fn){
          return function(reduceFn){
            return function(result, input){
              return reduceFn(result, fn(input))
            }
          }
        }
        function rreduce(reduceFn, init, reducible){
          return reducible(reduceFn, init);
        }
        function reducer(coll, xf){
          return function reducible(reduceFn, init){
            return _.reduce(xf(reduceFn), init, coll);
          }
        }
        expect(
          rreduce(_.sum, 0, reducer([1, 2, 3], map(_.inc)))
        ).toBe(9);
      });
    });

    describe('tranducer', () => {
      it('transduce', () => {
        expect(
           _.transduce(_.map(_.inc), _.sum, 0, [1, 2, 3])
        ).toBe(9)
      });

      it('transduce vector and seq', () => {
        const getMaleNameXf = _.comp(
          _.filter(d=>d.sex=='male'),
          _.map(d=>d.name))
        expect(_.into(_.vector(), getMaleNameXf, data)
               .toString()).toBe('["马儒" "全蛋"]')
        expect(
          _.take(2, _.sequence(getMaleNameXf, data))
            .toString()
        ).toBe('("马儒" "全蛋")');
      })
    });

    describe('pipe', () => {
      it('pipeline', () => {
        expect(
          _.pipeline([1, 2, 3, 4, 5],
                     _.rest,
                     _.partial(_.filter, item => item > 3),
                     _.first,
                     _.inc
                    )
            .toString()
        ).toBe('5')
      });
    });

    describe('pipe vs comp', () => {
      const todos = [
        {name: "make a hubot", done: true},
        {name: "teach hubot functional programming", done: true},
        {name: "let hubot do all my job", done:false}
      ];
      const {comp,pipeline,partial,inc,filter,sort} = require('mori')
      const sortByName = partial(sort, (x,y)=>x.name<y.name)
      const filterActive = partial(filter, x=>!x.done)
      it('pipe', () => {
        expect(
         pipeline(todos, filterActive, sortByName)
            .toString()
        ).toBe('(#js {:name "let hubot do all my job", :done false})')

      });

      it('comp', () => {
        expect(
          comp(sortByName, filterActive)(todos)
            .toString()).toBe('(#js {:name "let hubot do all my job", :done false})')
      });
    });
  });
});
