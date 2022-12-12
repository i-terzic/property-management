const property = require("./property/property.service.js");
const unit = require('./unit/unit.service.js');
// eslint-disable-next-line no-unused-vars
module.exports = function (app) {
  app.configure(property);
  app.configure(unit);
};
