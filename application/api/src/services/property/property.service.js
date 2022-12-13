// Initializes the `property` service on path `/property`
const { Property } = require("./property.class");
const hooks = require("./property.hooks");
const { property } = require("../../validations");

module.exports = function (app) {
  const options = {
    paginate: app.get("paginate"),
  };
  console.log(app.locals.db);

  // Initialize our service with any options it requires
  app.use("/property", new Property(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service("property");

  service.hooks(property).hooks(hooks);
};
