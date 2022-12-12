// Initializes the `open-position` service on path `/open-position`
const { OpenPosition } = require('./open-position.class');
const hooks = require('./open-position.hooks');

module.exports = function (app) {
  const options = {
    paginate: app.get('paginate')
  };

  // Initialize our service with any options it requires
  app.use('/open-position', new OpenPosition(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service('open-position');

  service.hooks(hooks);
};
