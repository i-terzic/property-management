// Initializes the `CsvImport` service on path `/csv-import`
const { CsvImport } = require('./csv-import.class');
const hooks = require('./csv-import.hooks');

module.exports = function (app) {
  const options = {
    paginate: app.get('paginate')
  };

  // Initialize our service with any options it requires
  app.use('/csv-import', new CsvImport(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service('csv-import');

  service.hooks(hooks);
};
