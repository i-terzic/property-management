/* eslint-disable no-console */
const logger = require("./logger");
const app = require("./app");
const sql = require("mssql");

const { database: dbConfig } = require("../config/dbConfig.json");
const appPool = new sql.ConnectionPool(dbConfig);

appPool
  .connect()
  .then((pool) => {
    app.locals.db = pool;
    const port = app.get("port");
    const server = app.listen(port);
    server.on("listening", () =>
      logger.info(
        "Feathers application started on http://%s:%d",
        app.get("host"),
        port
      )
    );
  })
  .catch((e) => {
    logger.error("Error creating connection pool", e);
  });

process.on("unhandledRejection", (reason, p) =>
  logger.error("Unhandled Rejection at: Promise ", p, reason)
);
