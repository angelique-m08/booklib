const request = require('supertest');
const app = require('../app');
const connection = require('../conf');

//npm run test:watch

describe('Test routes', () => {
  it('GET / sends "Bienvenue sur Booklib" as json', (done) => {
    request(app)
      .get('/')
      .expect(200)
      .expect('Content-Type', /json/)
      .then(response => {
        const expected = { message: 'Bienvenue sur Booklib'};
        expect(response.body).toEqual(expected);
        done();
      });
  });
});