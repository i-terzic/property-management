const app = require('../../src/app');

describe('\'tenant\' service', () => {
  it('registered the service', () => {
    const service = app.service('tenant');
    expect(service).toBeTruthy();
  });
});
