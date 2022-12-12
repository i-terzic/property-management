// Initializes the `prepayment` service on path `/prepayment`
const { Prepayment } = require('./prepayment.class');
const hooks = require('./prepayment.hooks');

module.exports = function (app) {
  const options = {
    paginate: app.get('paginate')
  };

  // Initialize our service with any options it requires
  app.use('/prepayment', new Prepayment(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service('prepayment');

  service.hooks(hooks);
};
