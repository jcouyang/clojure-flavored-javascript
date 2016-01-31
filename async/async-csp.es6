const mori = require('con.js')
require("babel-polyfill");
const {async} = require('con.js/async');

async function player(name, table) {
  while (true) {
    var ball = await async.take(table);
    ball.hits += 1;
    console.log(name + " " + ball.hits);
    await async.take(async.timeout(100));
    async.put(table, ball);
  }
}

async function game() {
  var table = async.chan();
  player("ping", table);
  player("pong", table);
  await async.put(table,{hits: 0});
  await async.take(async.timeout(1000));
  await async.close$(table);
};
game();
