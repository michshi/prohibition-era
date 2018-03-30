exports.seed = function (knex, Promise) {
  // Deletes ALL existing entries
  return knex('cocktails_ingredients').del()
    .then(function () {
      // Inserts seed entries
      return knex('cocktails_ingredients').insert([
        { cocktail_id: 3, ingredient_id: 1 },
        { cocktail_id: 3, ingredient_id: 2 },
        { cocktail_id: 3, ingredient_id: 3 },
        { cocktail_id: 3, ingredient_id: 4 },
        { cocktail_id: 1, ingredient_id: 8 },
        { cocktail_id: 1, ingredient_id: 9 },
        { cocktail_id: 1, ingredient_id: 10 },
        { cocktail_id: 1, ingredient_id: 11 },
        { cocktail_id: 2, ingredient_id: 5 },
        { cocktail_id: 2, ingredient_id: 6 },
        { cocktail_id: 2, ingredient_id: 7 }
      ])
    })
  // !!! Note that we don't need to reset the sequence here!
}
