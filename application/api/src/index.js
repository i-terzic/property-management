/* eslint-disable no-console */
const logger = require("./logger");
const app = require("./app");
const { appPool } = require("./db");

appPool
  .connect()
  .then(() => {
    const port = app.get("port");
    const server = app.listen(port);
    logger.info("Connected to SQL Server");
    server.on("listening", () => {
      logger.info(
        "Feathers application started on http://%s:%d",
        app.get("host"),
        port
      );
    });
  })
  .catch((e) => {
    logger.error("Error creating connection pool", e);
  });

process.on("unhandledRejection", (reason, p) =>
  logger.error("Unhandled Rejection at: Promise ", p, reason)
);
