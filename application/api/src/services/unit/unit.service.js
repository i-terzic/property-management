// Initializes the `unit` service on path `/unit`
const { Unit } = require("./unit.class");
const hooks = require("./unit.hooks");
const { unit } = require("../../validations");

module.exports = function (app) {
  const options = {
    paginate: app.get("paginate"),
  };

  // Initialize our service with any options it requires
  app.use("/unit", new Unit(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service("unit");

  service.hooks(unit).hooks(hooks);
};
