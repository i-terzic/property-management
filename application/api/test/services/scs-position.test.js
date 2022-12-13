const app = require('../../src/app');

describe('\'scs-position\' service', () => {
  it('registered the service', () => {
    const service = app.service('scs-position');
    expect(service).toBeTruthy();
  });
});
