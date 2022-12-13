// Initializes the `scs-position` service on path `/scs-position`
const { ScsPosition } = require('./scs-position.class');
const hooks = require('./scs-position.hooks');

module.exports = function (app) {
  const options = {
    paginate: app.get('paginate')
  };

  // Initialize our service with any options it requires
  app.use('/scs-position', new ScsPosition(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service('scs-position');

  service.hooks(hooks);
};
