const sinon = require('sinon');
const should = require('should');

describe('Chapter 1', function() {
  describe('#1.2.1 Programming Paradigm', function() {
    it('print 10 times 命令',function() {
      sinon.spy(console, 'log');
      for (let i=0;i<10;i++){
        console.log('命令',i)
      }
      console.log.callCount.should.be.eql(10);
    })
  });
  describe('#1.2.2 Native functional javascript', function() {
    it('support function as arguments', function() {
      [1,2,3,4].map(function(x){return ++x})
        .should.be.eql([2,3,4,5]);
    });

    context('mutable', function() {
      var array = [1,2,3,4];
      var result = [];
      for(var i of array){
        result.push(++i);
      }
      it('mutated the result array', function() {
        result.should.be.eql([2,3,4,5]);  
      })
    });
  });
  
  describe('#1.2.4 Lexical Binding', function() {
    var Multipler = function(inc){
      this.inc = inc;
    };
    
    context('self = this', function() {
      Multipler.prototype.multiple = function(numbers) {
        var self = this; 
        return numbers.map(function(number){
          return self.inc * number; 
        });
      };
      it('works', function() {
        new Multipler(2).multiple([1,2,3,4]).should.be.eql([2,4,6,8]);
      });
    });

    context('arrow function', function() {
      Multipler.prototype.multiple = function(numbers){
        return numbers.map(number => number*this.inc);
      };
      it('works', function() {
        new Multipler(2).multiple([1,2,3,4]).should.be.eql([2,4,6,8]);
      });
    });
  });

  describe('#1.2.6 Desctructure', () => {
    describe('eating oreo', function() {
      let dipMilk = sinon.stub(),
          lip = sinon.stub().returns('wetMiddleAndButton'),
          eat = sinon.spy();

      context('the old way', function() {
        let orea = ["top","middle","bottom"],
            top = orea.shift(), middleAndButton=orea,
            wetMiddleAndButton = dipMilk(middleAndButton),
            button = lip(wetMiddleAndButton);
        it("sucks", function() {
          eat([top, button]);
          eat.calledWith(['top', 'wetMiddleAndButton']).should.be.ok();
        });
      });

      context('the es6 way', function() {
        let [top, ...middleAndButton] = ["top","middle","bottom"];
        let wetMiddleAndButton = dipMilk(middleAndButton) ;
        let button = lip(wetMiddleAndButton);
        it("is awesome", function() {
          eat([top, button]);
          eat.calledWith(['top', 'wetMiddleAndButton']).should.be.ok();
        });
      });
    });
  });

  describe('#1.3.1 Immutable', () => {
    context('Array is Mutable', () => {
      var a = [1,2,3]
      a.push(4)
      it('a should be mutated', () => {
        a.should.be.eql([1,2,3,4])
      });      
    });
    context('Vector is Immutable', () => {
      
    });
  });

  describe('', () => {
    
  });
});
