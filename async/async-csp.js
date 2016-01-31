'use strict';

function _asyncToGenerator(fn) { return function () { var gen = fn.apply(this, arguments); return new Promise(function (resolve, reject) { var callNext = step.bind(null, "next"); var callThrow = step.bind(null, "throw"); function step(key, arg) { try { var info = gen[key](arg); var value = info.value; } catch (error) { reject(error); return; } if (info.done) { resolve(value); } else { Promise.resolve(value).then(callNext, callThrow); } } callNext(); }); }; }

var mori = require('con.js');
require("babel-polyfill");

var _require = require('con.js/async');

var async = _require.async;

var player = (function () {
  var ref = _asyncToGenerator(regeneratorRuntime.mark(function _callee(name, table) {
    var ball;
    return regeneratorRuntime.wrap(function _callee$(_context) {
      while (1) {
        switch (_context.prev = _context.next) {
          case 0:
            if (!true) {
              _context.next = 11;
              break;
            }

            _context.next = 3;
            return async.take(table);

          case 3:
            ball = _context.sent;

            ball.hits += 1;
            console.log(name + " " + ball.hits);
            _context.next = 8;
            return async.take(async.timeout(100));

          case 8:
            async.put(table, ball);
            _context.next = 0;
            break;

          case 11:
          case 'end':
            return _context.stop();
        }
      }
    }, _callee, this);
  }));

  return function player(_x, _x2) {
    return ref.apply(this, arguments);
  };
})();

var game = (function () {
  var ref = _asyncToGenerator(regeneratorRuntime.mark(function _callee2() {
    var table;
    return regeneratorRuntime.wrap(function _callee2$(_context2) {
      while (1) {
        switch (_context2.prev = _context2.next) {
          case 0:
            table = async.chan();

            player("ping", table);
            player("pong", table);
            _context2.next = 5;
            return async.put(table, { hits: 0 });

          case 5:
            _context2.next = 7;
            return async.take(async.timeout(1000));

          case 7:
            _context2.next = 9;
            return async.close$(table);

          case 9:
          case 'end':
            return _context2.stop();
        }
      }
    }, _callee2, this);
  }));

  return function game() {
    return ref.apply(this, arguments);
  };
})();

;
game();

