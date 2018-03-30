module.exports = {
  development: {
    client: 'pg',
    connection: 'postgres://localhost/prohibitionera'
  },
  production: {
    client: 'pg',
    connection: process.env.DATABASE_URL
  }
}
