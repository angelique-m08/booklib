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

/*--------------------- BOOK TESTS --------------------*/

describe('Test book:', () => {
  const testbook1 = { title: "Le Sorceleur - Le Dernier Voeu", resume: "Geralt de Riv est un homme inquiétant, un mutant devenu le parfait assassin grâce à la magie et à un long entraînement. En ces temps obscurs, ogres, goules et vampires pullulent, et les magiciens sont des manipulateurs experts. Contre ces menaces, il faut un tueur à gages à la hauteur, et Geralt est plus qu'un guerrier ou un mage. C'est un sorceleur. Au cours de ses aventures, il rencontrera une magicienne capricieuse aux charmes vénéneux, un troubadour paillard au grand coeur... et, au terme de sa quête, peut-être réalisera-t-il son dernier voeu: retrouver son humanité perdue.", genre: "Fantasy" };
  const testbook2 = { title: "Deux gouttes d'eau", resume: "Une jeune femme est retrouvée morte dans son appartement de Boulogne-Billancourt, massacrée à coups de hache. Elle s'appelle Élodie et son ami, Antoine Deloye, est identifié sur l'enregistrement d'une caméra de vidéosurveillance de la ville, sortant de chez elle, l'arme du crime à la main. Immédiatement placé en garde à vue, Antoine s'obstine à nier malgré les évidences. Il accuse son frère jumeau, Franck, d'avoir profité de leur ressemblance pour mettre au point une machination destinée à le perdre. Quand Franck Deloye arrive au commissariat central pour être entendu, le trouble est immense : il est impossible de différencier les deux hommes, qui se ressemblent, littéralement, comme deux gouttes d'eau... ", genre: "Policier" };
  beforeEach((done) =>
    connection.query('SET FOREIGN_KEY_CHECKS = 0', () =>
      connection.query('TRUNCATE book', () =>
        connection.query('SET FOREIGN_KEY_CHECKS = 1', () =>
          connection.query('INSERT INTO book SET ?', testbook1, () =>
            connection.query('INSERT INTO book SET ?', testbook2, done)
          )
        )
      )
    )
  );
    it('GET / sends all books', (done) => {
      request(app)
        .get('/books')
        .expect(200)
        .then(response => {
          done();
        });
    });
    it('POST / correct creation of book', (done) => {
      request(app)
        .post('/books')
        .send(testbook1)
        .expect(201)
        .then(response => {
          done();
        });
    });
    it('POST / field missing', (done) => {
      request(app)
        .post('/books')
        .send({})
        .expect(400)
        .expect('Content-Type', /json/)
        .then(response => {
          const expected = { message: "Vous n'avez pas complété les champs nécessaires" }
          expect(response.body).toEqual(expected);
          done();
        });
    });
    it('PUT / correct modification', (done) => {
      request(app)
        .put('/books/1')
        .send({
          title: 'Le Sorceleur - Le Dernier Voeu (tome1)'
        })
        .expect(200)
        .then(response => {
          done();
        });
    });
});