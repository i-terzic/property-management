const app = require('../../src/app');

describe('\'CsvImport\' service', () => {
  it('registered the service', () => {
    const service = app.service('csv-import');
    expect(service).toBeTruthy();
  });
});
