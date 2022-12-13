const app = require('../../src/app');

describe('\'prepayment\' service', () => {
  it('registered the service', () => {
    const service = app.service('prepayment');
    expect(service).toBeTruthy();
  });
});
