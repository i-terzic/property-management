const sql = require("mssql");

const { database: dbConfig } = require("../../config/dbConfig.json");
const appPool = new sql.ConnectionPool(dbConfig);

module.exports = { appPool };
