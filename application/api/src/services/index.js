const property = require("./property/property.service.js");
const unit = require("./unit/unit.service.js");
const openPosition = require("./open-position/open-position.service.js");
const tenant = require("./tenant/tenant.service.js");
const scsPosition = require("./scs-position/scs-position.service.js");
const prepayment = require("./prepayment/prepayment.service.js");

// eslint-disable-next-line no-unused-vars
module.exports = function (app) {
  app.configure(property);
  app.configure(unit);
  app.configure(openPosition);
  app.configure(tenant);
  app.configure(scsPosition);
  app.configure(prepayment);
};
