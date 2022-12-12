const app = require('../../src/app');

describe('\'prepayments\' service', () => {
  it('registered the service', () => {
    const service = app.service('prepayments');
    expect(service).toBeTruthy();
  });
});
