const Pool = require('pg').Pool;

const pool = new Pool ({
    user : 'postgres_sql',
    password: 'LCcOCmJQrgFIMQVNQG3RNzQTgtcg7kkb',
    host: 'dpg-ceql1d9gp3jv6g755vag-a.frankfurt-postgres.render.com',
    port: 5432,
    database: 'travel_explore_db'
});

module.exports = pool;
