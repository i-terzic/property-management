const csvImport = require("./csv-import/csv-import.service.js");
// eslint-disable-next-line no-unused-vars
module.exports = function (app) {
  app.configure(csvImport);
};
