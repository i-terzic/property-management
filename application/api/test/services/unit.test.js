const app = require('../../src/app');

describe('\'unit\' service', () => {
  it('registered the service', () => {
    const service = app.service('unit');
    expect(service).toBeTruthy();
  });
});
