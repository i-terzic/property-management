const app = require('../../src/app');

describe('\'open-position\' service', () => {
  it('registered the service', () => {
    const service = app.service('open-position');
    expect(service).toBeTruthy();
  });
});
