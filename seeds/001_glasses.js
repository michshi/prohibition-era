exports.seed = function (knex, Promise) {
  // Deletes ALL existing entries
  return knex('glasses').del()
    .then(function () {
      // Inserts seed entries
      return knex('glasses').insert([
        { id: 1, name: 'rocks' },
        { id: 2, name: 'coupe' },
        { id: 3, name: 'champagne flute' }
      ])
    })
    .then(() => {
      return knex.raw(`SELECT setval('glasses_id_seq', (SELECT MAX(id) FROM glasses));`)
    })
}
