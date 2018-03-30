const chalk = require('chalk')
const knex = require('./knex') // Make sure you do ./knex

function demo01() {
  knex
    .select('*')
    .from('glasses')
    .then(rows => {
      console.log(rows)
      knex.destroy()
    })
}

demo01()
